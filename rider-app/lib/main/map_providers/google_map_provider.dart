import 'dart:async';
import 'dart:ui';

import 'package:client_shared/config.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/config.dart';
import 'package:ridy/location_selection/location_selection_parent_view.dart';
import 'package:ridy/main/bloc/current_location_cubit.dart';
import 'package:geolocator/geolocator.dart' as geo;

import '../bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../graphql/generated/graphql_api.graphql.dart';

class GoogleMapProvider extends StatefulWidget {
  const GoogleMapProvider({Key? key}) : super(key: key);

  @override
  State<GoogleMapProvider> createState() => _GoogleMapProviderState();
}

class _GoogleMapProviderState extends State<GoogleMapProvider> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? center;
  var taxiMarker = getBytesFromAsset('images/marker_taxi.png', 96);
  var positionMarker = getBytesFromAsset('images/marker.png', 128);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(fallbackLocation.latitude, fallbackLocation.longitude),
    zoom: 14.4746,
  );

  @override
  void initState() {
    geo.Geolocator.getLastKnownPosition().then((value) async {
      if (value == null) return;
      (await _controller.future).animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(value.latitude, value.longitude), zoom: 15),
        ),
      );
    });
    // if (Platform.isAndroid) {
    //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([taxiMarker, positionMarker]),
        builder: (builder, AsyncSnapshot<List<Uint8List>> iconsBytesSnapshot) =>
            BlocConsumer<MainBloc, MainBlocState>(
              listener: (context, state) async {
                if (state is SelectingPoints && center != null) {
                  (await _controller.future).animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(center!.latitude, center!.longitude),
                          zoom: 15),
                    ),
                  );
                }
                if (state is OrderPreview ||
                    state is OrderInProgress ||
                    state is OrderReview ||
                    state is OrderInvoice) {
                  (await _controller.future).animateCamera(
                      CameraUpdate.newLatLngBounds(
                          boundsFromLatLngList(state.markers
                              .map((e) => LatLng(
                                  e.position.latitude, e.position.longitude))
                              .toList()),
                          50));
                }
              },
              builder: (context, state) => Column(
                children: [
                  Expanded(
                    child: GoogleMap(
                      initialCameraPosition: _kGooglePlex,
                      zoomGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      scrollGesturesEnabled: false,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      trafficEnabled: false,
                      myLocationButtonEnabled: false,
                      onCameraMove: (position) => center = position.target,
                      onCameraIdle: () async {
                        if (center == null) return;
                        setCurrentLocation(context, center!);
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: state.markers
                          .map((e) => e.toGoogleMarker(
                              iconsBytesSnapshot.data?[0] ??
                                  Uint8List.fromList([]),
                              iconsBytesSnapshot.data?[1] ??
                                  Uint8List.fromList([])))
                          .toSet(),
                    ),
                  ),
                  SizedBox(
                    height: getStateSize(state),
                  )
                ],
              ),
            ));
  }

  void setCurrentLocation(BuildContext context, LatLng position) async {
    final geocodeResult = await Nominatim.reverseSearch(
        lat: position.latitude, lon: position.longitude, nameDetails: true);
    final fullLocation = geocodeResult.toFullLocation();
    try {
      context.read<CurrentLocationCubit>().updateLocation(fullLocation);
      // ignore: empty_catches
    } catch (error) {}
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
    final result = await client.mutate(MutationOptions(
        document: GET_DRIVERS_LOCATION_QUERY_DOCUMENT,
        variables: GetDriversLocationArguments(
                point:
                    PointInput(lat: position.latitude, lng: position.longitude))
            .toJson(),
        fetchPolicy: FetchPolicy.noCache));
    final locations = GetDriversLocation$Query.fromJson(result.data!)
        .getDriversLocation
        .map((e) => e.toLatLng())
        .toList();
    context.read<MainBloc>().add(SetDriversLocations(locations));
  }

  double getStateSize(MainBlocState state) {
    if (state is SelectingPoints) return 140;
    if (state is OrderPreview || state is OrderInProgress) return 390;
    if (state is OrderLooking) return 160;
    if (state is OrderReview || state is OrderInvoice) return 160;
    return 0;
  }
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  double? x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > (x1 ?? 0)) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > (y1 ?? 0)) y1 = latLng.longitude;
      if (latLng.longitude < (y0 ?? 0)) y0 = latLng.longitude;
    }
  }
  return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
}
