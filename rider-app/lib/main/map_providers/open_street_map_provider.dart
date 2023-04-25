import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../location_selection/location_selection_parent_view.dart';
import '../../location_selection/welcome_card/place_search_sheet_view.dart';
import '../bloc/current_location_cubit.dart';
import '../bloc/main_bloc.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';

class OpenStreetMapProvider extends StatefulWidget {
  const OpenStreetMapProvider({Key? key}) : super(key: key);

  @override
  OpenStreetMapState createState() => OpenStreetMapState();
}

class OpenStreetMapState extends State<OpenStreetMapProvider>
    with TickerProviderStateMixin {
  MapController? controller = MapController();

  @override
  Widget build(BuildContext context) {
    var mainBloc = context.read<MainBloc>();
    return FlutterMap(
        mapController: controller,
        options: MapOptions(
            maxZoom: 20, zoom: 16, interactiveFlags: InteractiveFlag.none),
        children: [
          if (mapProvider == MapProvider.openStreetMap ||
              (mapProvider == MapProvider.googleMap &&
                  mapBoxAccessToken.isEmptyOrNull))
            openStreetTileLayer,
          if (mapProvider == MapProvider.mapBox ||
              (mapProvider == MapProvider.googleMap &&
                  !mapBoxAccessToken.isEmptyOrNull))
            mapBoxTileLayer,
          BlocBuilder<CurrentLocationCubit, FullLocation?>(
              builder: (context, state) => state == null
                  ? const SizedBox()
                  : CurrentLocationLayer(
                      followOnLocationUpdate: FollowOnLocationUpdate.once)),
          BlocConsumer<MainBloc, MainBlocState>(listener: (context, state) {
            if (state is OrderPreview) {
              controller?.fitBounds(
                  LatLngBounds.fromPoints(
                      state.points.map((e) => e.latlng).toList()),
                  options: fitBoundsOptions);
            }
            if (state is StateWithActiveOrder) {
              controller?.fitBounds(
                  LatLngBounds.fromPoints(state.currentOrder.points
                      .map((e) => e.toLatLng())
                      .toList()),
                  options: fitBoundsOptions);
            }
          }, builder: (context, state) {
            return Stack(
              children: [
                if (state is OrderPreview &&
                    state.directions != null &&
                    state.directions!.isNotEmpty)
                  PolylineLayer(saveLayers: true, polylines: [
                    Polyline(
                        points: state.directions!,
                        strokeWidth: 5,
                        color: CustomTheme.primaryColors)
                  ]),
                if (state is StateWithActiveOrder &&
                    state.currentOrder.directions != null)
                  PolylineLayer(saveLayers: true, polylines: [
                    Polyline(
                        points: state.currentOrder.directions!
                            .map((e) => LatLng(e.lat, e.lng))
                            .toList(),
                        strokeWidth: 5,
                        color: CustomTheme.primaryColors)
                  ]),
                if (state is SelectingPoints)
                  FutureBuilder<List<Position?>>(
                      future: Future.wait([
                        if (!kIsWeb) Geolocator.getLastKnownPosition(),
                        Geolocator.getCurrentPosition()
                      ]),
                      builder: (context, snapshot) {
                        if (snapshot.data?.first != null ||
                            snapshot.data?.last != null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setCurrentLocation(context, snapshot.data!);
                          });
                        }
                        return BlocConsumer<CurrentLocationCubit,
                            FullLocation?>(
                          listener: (context, currentLocation) {
                            // This is very important and could potentially fix the big bug we had
                            if (!mounted || currentLocation == null) return;
                            controller?.fitBounds(
                                LatLngBounds.fromPoints(state.driverLocations
                                    .followedBy(
                                        [currentLocation.latlng]).toList()),
                                options: fitBoundsOptions);
                          },
                          builder: (context, currentLocation) {
                            if (currentLocation == null) {
                              return const SizedBox();
                            }
                            return Query(
                                options: QueryOptions(
                                    document:
                                        GET_DRIVERS_LOCATION_QUERY_DOCUMENT,
                                    variables: GetDriversLocationArguments(
                                            point:
                                                currentLocation.toPointInput())
                                        .toJson()),
                                builder: (QueryResult result,
                                    {Refetch? refetch, FetchMore? fetchMore}) {
                                  if (result.isLoading || result.hasException) {
                                    return const SizedBox();
                                  }
                                  final List<LatLng> locations =
                                      GetDriversLocation$Query.fromJson(
                                              result.data!)
                                          .getDriversLocation
                                          .map((e) => e.toLatLng())
                                          .toList();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    mainBloc
                                        .add(SetDriversLocations(locations));
                                  });
                                  return const SizedBox();
                                });
                          },
                        );
                      }),
                MarkerLayer(
                    markers: state.markers
                        .map((e) => e.toFlutterMapMarker())
                        .toList())
              ],
            );
          })
        ]);
  }

  void setCurrentLocation(
      BuildContext context, List<Position?> positions) async {
    final position = positions.last ?? positions.first;
    if (position == null) return;
    final geocodeResult = await Nominatim.reverseSearch(
        lat: position.latitude, lon: position.longitude, nameDetails: true);
    final fullLocation = geocodeResult.toFullLocation();
    try {
      context.read<CurrentLocationCubit>().updateLocation(fullLocation);
      controller?.move(LatLng(position.latitude, position.longitude), 16);
      // ignore: empty_catches
    } catch (error) {}
  }

  // void _animatedMapMove(LatLng destLocation, double destZoom) {
  //   // Create some tweens. These serve to split up the transition from one location to another.
  //   // In our case, we want to split the transition be<tween> our current map center and the destination.
  //   final _latTween = Tween<double>(
  //       begin: mapController.center.latitude, end: destLocation.latitude);
  //   final _lngTween = Tween<double>(
  //       begin: mapController.center.longitude, end: destLocation.longitude);
  //   final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

  //   // Create a animation controller that has a duration and a TickerProvider.
  //   var controller = AnimationController(
  //       duration: const Duration(milliseconds: 500), vsync: this);
  //   // The animation determines what path the animation will take. You can try different Curves values, although I found
  //   // fastOutSlowIn to be my favorite.
  //   Animation<double> animation =
  //       CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

  //   controller.addListener(() {
  //     mapController.move(
  //         LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
  //         _zoomTween.evaluate(animation));
  //   });

  //   animation.addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       controller.dispose();
  //     } else if (status == AnimationStatus.dismissed) {
  //       controller.dispose();
  //     }
  //   });

  //   controller.forward();
  // }
}
