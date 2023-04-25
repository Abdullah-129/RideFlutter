import 'dart:async';

import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class PlaceConfirmSheetView extends StatefulWidget {
  final FullLocation? defaultLocation;

  const PlaceConfirmSheetView(this.defaultLocation, {Key? key})
      : super(key: key);

  @override
  State<PlaceConfirmSheetView> createState() => _PlaceConfirmSheetViewState();
}

class _PlaceConfirmSheetViewState extends State<PlaceConfirmSheetView> {
  final MapController mapController = MapController();

  String? address;
  late StreamSubscription<MapEvent> subscription;
  LatLng? center;

  @override
  void initState() {
    address ??= widget.defaultLocation?.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          onMapReady: () {
            center = mapController.center;
            subscription =
                mapController.mapEventStream.listen((MapEvent mapEvent) async {
              if (mapEvent is MapEventMoveStart) {
                setState(() {
                  address = null;
                });
              } else if (mapEvent is MapEventMoveEnd) {
                final reverseSearchResult = await Nominatim.reverseSearch(
                    lat: mapController.center.latitude,
                    lon: mapController.center.longitude,
                    nameDetails: true);
                final fullLocation =
                    reverseSearchResult.convertToFullLocation();
                center = mapController.center;
                if (!mounted) return;
                setState(() {
                  address = fullLocation.address;
                });
              }
            });
          },
          maxZoom: 20,
          zoom: 16,
          center: widget.defaultLocation?.latlng ?? fallbackLocation,
          interactiveFlags: InteractiveFlag.drag |
              InteractiveFlag.pinchMove |
              InteractiveFlag.pinchZoom |
              InteractiveFlag.doubleTapZoom),
      children: [
        if (mapProvider == MapProvider.openStreetMap ||
            (mapProvider == MapProvider.googleMap &&
                mapBoxAccessToken.isEmptyOrNull))
          openStreetTileLayer,
        if (mapProvider == MapProvider.mapBox ||
            (mapProvider == MapProvider.googleMap &&
                !mapBoxAccessToken.isEmptyOrNull))
          mapBoxTileLayer,
        CurrentLocationLayer(
            followOnLocationUpdate: FollowOnLocationUpdate.never),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 63),
            child: MarkerNew(address: address),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: address == null
                      ? null
                      : () {
                          final newLocation = FullLocation(
                              latlng: mapController.center,
                              address: address!,
                              title: widget.defaultLocation?.title ?? "");
                          // final box =
                          //     Hive.box<List<LocationHistoryItem>>(
                          //         "history2");
                          // var items = (box.get("items",
                          //         defaultValue:
                          //             List<LocationHistoryItem>.from(
                          //                 []))
                          //     as List<LocationHistoryItem>);
                          // if (items.length > 9) {
                          //   items.removeRange(9, items.length - 1);
                          // }
                          // items = [
                          //   newLocation.toLocationHistoryItem()
                          // ].followedBy(items).toList();
                          // box.put("items", items);

                          Navigator.of(context).pop(newLocation);
                        },
                  child: Text(S.of(context).action_confirm_location)),
            ),
          ),
        )
      ],
    );
  }
}
