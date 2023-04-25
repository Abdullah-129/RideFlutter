import 'package:client_shared/components/marker_new.dart';
import 'package:client_shared/map_providers.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:ridy/config.dart';
import 'package:ridy/current_location_cubit.dart';

import 'package:client_shared/config.dart';
import '../main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:hive/hive.dart';
import 'package:latlong2/latlong.dart';
import '../graphql/generated/graphql_api.dart';

// ignore: must_be_immutable
class OpenStreetMapProvider extends StatelessWidget {
  MapController? mapController;
  final Stream<geo.Position> streamServerLocation =
      geo.Geolocator.getPositionStream(
          locationSettings: const geo.LocationSettings(distanceFilter: 50));
  OpenStreetMapProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    final locationCubit = context.read<CurrentLocationCubit>();
    return FlutterMap(
        mapController: mapController,
        options: MapOptions(
            maxZoom: 20,
            zoom: 12,
            interactiveFlags: InteractiveFlag.drag |
                InteractiveFlag.pinchMove |
                InteractiveFlag.pinchZoom |
                InteractiveFlag.doubleTapZoom),
        children: [
          if (mapProvider == MapProvider.openStreetMap) openStreetTileLayer,
          if (mapProvider == MapProvider.mapBox) mapBoxTileLayer,
          CurrentLocationLayer(
            followOnLocationUpdate: FollowOnLocationUpdate.once,
          ),
          BlocBuilder<MainBloc, MainState>(
              builder: (context, mainBlocState) =>
                  mainBlocState is StatusOnline && mainBlocState.orders.isEmpty
                      ? BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
                          builder: (context, state) {
                            if (state.location != null &&
                                state.radius != null) {
                              return CircleLayer(circles: <CircleMarker>[
                                CircleMarker(
                                    point: state.location!,
                                    color: Colors.blue.withOpacity(0.3),
                                    borderStrokeWidth: 2,
                                    borderColor:
                                        CustomTheme.secondaryColors.shade200,
                                    useRadiusInMeter: true,
                                    radius: state.radius!.toDouble()),
                              ]);
                            } else {
                              return Container();
                            }
                          },
                        )
                      : Container()),
          BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is StatusOnline &&
                  state.orders.isNotEmpty &&
                  state.selectedOrder != null) {
                return PolylineLayer(saveLayers: false, polylines: [
                  Polyline(
                      points: state.selectedOrder?.directions
                              ?.map((e) => LatLng(e.lat, e.lng))
                              .toList() ??
                          [],
                      strokeWidth: 5,
                      color: CustomTheme.primaryColors)
                ]);
              }
              return const SizedBox();
            },
          ),
          BlocBuilder<MainBloc, MainState>(
              builder: (context, state) => MarkerLayer(
                  markers: state.markers
                      .map((e) => Marker(
                          point: e.position,
                          width: 240,
                          height: 63,
                          builder: (context) => MarkerNew(address: e.address)))
                      .toList())),
          BlocConsumer<MainBloc, MainState>(
            listenWhen: (previous, next) {
              if (previous is StatusOnline &&
                  next is StatusOnline &&
                  previous.selectedOrder?.id == next.selectedOrder?.id) {
                return false;
              }
              return next is StatusOnline || next is StatusInService;
            },
            listener: (context, state) {
              geo.Geolocator.checkPermission().then((value) {
                if (value == geo.LocationPermission.denied) {
                  geo.Geolocator.requestPermission();
                }
              });
              final currentLocation = locationCubit.state.location;
              if (state.markers.isNotEmpty) {
                final points = state.markers
                    .map((e) => e.position)
                    .followedBy(
                        currentLocation != null ? [currentLocation] : [])
                    .toList();
                mapController?.fitBounds(LatLngBounds.fromPoints(points),
                    options: const FitBoundsOptions(
                        padding: EdgeInsets.only(
                            top: 130, left: 130, right: 130, bottom: 500)));
              }
              if (currentLocation == null &&
                  (state is StatusOnline || state is StatusInService)) {
                geo.Geolocator.getCurrentPosition().then(
                    (value) => onLocationUpdated(value, mainBloc, context));
              }
            },
            builder: (context, state) {
              if (state is StatusOffline) {
                return const SizedBox();
              }
              return Stack(
                children: [
                  if (state is StatusOnline)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SafeArea(
                          minimum: EdgeInsets.only(
                              bottom: state.orders.isEmpty ? 96.0 : 350,
                              right: 16.0),
                          child: FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              mini: true,
                              elevation: 0,
                              backgroundColor:
                                  CustomTheme.primaryColors.shade50,
                              onPressed: () {
                                final currentLocation = context
                                    .read<CurrentLocationCubit>()
                                    .state
                                    .location;

                                if (currentLocation == null) return;
                                mapController?.move(currentLocation, 16);
                              },
                              child: Icon(
                                Icons.location_searching,
                                color: CustomTheme.neutralColors.shade500,
                              ))),
                    ),
                  StreamBuilder<geo.Position>(
                      stream: streamServerLocation,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          onLocationUpdated(snapshot.data!, mainBloc, context);
                        }
                        return const SizedBox();
                      }),
                ],
              );
            },
          ),
        ]);
  }
}

void onLocationUpdated(
    geo.Position position, MainBloc bloc, BuildContext context) async {
  final httpLink = HttpLink(
    "${serverUrl}graphql",
  );
  final authLink = AuthLink(
    getToken: () async => 'Bearer ${Hive.box('user').get('jwt')}',
  );
  Link link = authLink.concat(httpLink);
  final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
  final newLocation = LatLng(position.latitude, position.longitude);
  context.read<CurrentLocationCubit>().setCurrentLocation(newLocation);
  final res = await client.mutate(MutationOptions(
      document: UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT,
      variables: UpdateDriverLocationArguments(
              point:
                  PointInput(lat: position.latitude, lng: position.longitude))
          .toJson(),
      fetchPolicy: FetchPolicy.noCache));
  bloc.add(AvailableOrdersUpdated(res.data!['updateDriversLocationNew']));
}
