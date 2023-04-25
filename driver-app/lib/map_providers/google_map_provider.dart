import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridy/current_location_cubit.dart';

import '../main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:geolocator/geolocator.dart' as geo;
import '../graphql/generated/graphql_api.dart';
import 'open_street_map_provider.dart';

// ignore: must_be_immutable
class GoogleMapProvider extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  late BitmapDescriptor iconPickup;

  final Stream<geo.Position> streamServerLocation =
      geo.Geolocator.getPositionStream(
          locationSettings: const geo.LocationSettings(distanceFilter: 50));

  GoogleMapProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Mutation(
        options:
            MutationOptions(document: UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          BitmapDescriptor.fromAssetImage(
                  const ImageConfiguration(size: Size(48, 48)),
                  'images/marker.png')
              .then((onValue) {
            iconPickup = onValue;
          });

          return BlocConsumer<MainBloc, MainState>(
              listenWhen: (previous, next) =>
                  next is StatusOnline || next is StatusInService,
              listener: (context, state) async {
                geo.Geolocator.checkPermission().then((value) {
                  if (value == geo.LocationPermission.denied) {
                    geo.Geolocator.requestPermission();
                  }
                });
                final currentLocation =
                    context.read<CurrentLocationCubit>().state.location;

                if (state.markers.isNotEmpty) {
                  final points = state.markers
                      .map((e) =>
                          LatLng(e.position.latitude, e.position.longitude))
                      .followedBy(currentLocation != null
                          ? [
                              LatLng(currentLocation.latitude,
                                  currentLocation.longitude)
                            ]
                          : [])
                      .toList();
                  (await _controller.future).animateCamera(
                      CameraUpdate.newLatLngBounds(
                          boundsFromLatLngList(points), 100));
                }
                if (state is StatusOnline &&
                    state.orders.isEmpty &&
                    currentLocation != null) {
                  (await _controller.future).animateCamera(
                      CameraUpdate.newLatLngZoom(
                          LatLng(currentLocation.latitude,
                              currentLocation.longitude),
                          16));
                }
                if ((state is StatusOnline && currentLocation == null) ||
                    (state is StatusInService &&
                        state.currentLocation == null)) {
                  geo.Geolocator.getCurrentPosition().then(
                      (value) => onLocationUpdated(value, mainBloc, context));
                }
              },
              builder: (context, state) => Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: _kGooglePlex,
                        padding: const EdgeInsets.only(bottom: 50),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: state is StatusOffline ||
                            (state is StatusOnline && state.orders.isEmpty),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                        markers: state.markers
                            .map((e) => Marker(
                                markerId: MarkerId(e.id),
                                icon: iconPickup,
                                position: LatLng(
                                    e.position.latitude, e.position.longitude)))
                            .toSet(),
                      ),
                      if (state is! StatusOffline)
                        StreamBuilder<geo.Position>(
                            stream: streamServerLocation,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                onLocationUpdated(
                                    snapshot.data!, mainBloc, context);
                              }
                              return Container();
                            })
                    ],
                  ));
        });
  }
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
