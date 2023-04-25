import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/address/address_item_view.dart';
import 'package:ridy/address/address_location_selection_view.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import 'package:ridy/location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:client_shared/theme/theme.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddressDetailsView extends StatefulWidget {
  final GetAddresses$Query$RiderAddress? address;
  final RiderAddressType? defaultType;
  final FullLocation? currentLocation;

  const AddressDetailsView(
      {this.currentLocation, this.address, this.defaultType, Key? key})
      : super(key: key);

  @override
  State<AddressDetailsView> createState() => _AddressDetailsViewState();
}

class _AddressDetailsViewState extends State<AddressDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late MapController mapController;
  String title = "";
  String? details;
  RiderAddressType? type;

  @override
  void initState() {
    mapController = MapController();
    if (widget.address != null) {
      title = widget.address!.title;
      details = widget.address!.details;
      type = widget.address!.type;
    } else {
      type = widget.defaultType;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              RidyBackButton(text: S.of(context).action_back),
              const Spacer(),
              if (widget.address != null)
                Mutation(
                    options: MutationOptions(
                        document: DELETE_ADDRESS_MUTATION_DOCUMENT),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return CupertinoButton(
                        onPressed: () async {
                          final args =
                              DeleteAddressArguments(id: widget.address!.id)
                                  .toJson();
                          await runMutation(args).networkResult;
                          if (!mounted) return;
                          Navigator.pop(context);
                        },
                        minSize: 0,
                        padding: const EdgeInsets.all(0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.trash,
                                color: CustomTheme.neutralColors.shade600,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, top: 4),
                                child: Text(
                                  S.of(context).action_delete,
                                  style: TextStyle(
                                      color:
                                          CustomTheme.neutralColors.shade600),
                                ),
                              )
                            ]),
                      );
                    })
            ],
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).favorite_location_details_title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: title,
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Ionicons.ellipse,
                      color: CustomTheme.neutralColors,
                      size: 12,
                    ),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    hintText: S.of(context).create_address_title_textfield_hint,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).create_address_name_empty_error;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<RiderAddressType>(
                  value: type,
                  icon: const Icon(
                    Ionicons.chevron_down,
                    color: CustomTheme.neutralColors,
                  ),
                  validator: (RiderAddressType? type) => (type != null
                      ? null
                      : S.of(context).textbox_error_select_type_address),
                  decoration: InputDecoration(
                    hintText: S.of(context).placeholder_type,
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    isDense: true,
                    prefixIcon: const Icon(
                      Ionicons.ellipse,
                      color: CustomTheme.neutralColors,
                      size: 12,
                    ),
                  ),
                  items: <DropdownMenuItem<RiderAddressType>>[
                    createAddressType(RiderAddressType.home),
                    createAddressType(RiderAddressType.work),
                    createAddressType(RiderAddressType.gym),
                    createAddressType(RiderAddressType.cafe),
                    createAddressType(RiderAddressType.park),
                    createAddressType(RiderAddressType.parent),
                    createAddressType(RiderAddressType.partner),
                    createAddressType(RiderAddressType.other),
                  ],
                  onChanged: (RiderAddressType? value) => type = value,
                ),
              ],
            ),
          ),
          const Spacer(),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: CustomTheme.neutralColors.shade200,
                        blurRadius: 5,
                        spreadRadius: 1)
                  ]),
              constraints: const BoxConstraints(minHeight: 100, maxHeight: 350),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                    onMapReady: () {
                      if (widget.address != null) {
                        mapController.move(
                            widget.address!.location.toLatLng(), 16);
                      }
                    },
                    center: widget.address?.location.toLatLng() ??
                        widget.currentLocation?.latlng,
                    onTap: (position, latlng) async {
                      final location =
                          await showBarModalBottomSheet<FullLocation>(
                              context: context,
                              builder: (context) {
                                return AddressLocationSelectionView(
                                    details != null
                                        ? FullLocation(
                                            latlng: mapController.center,
                                            address: details!,
                                            title: title)
                                        : widget.currentLocation);
                              });
                      if (location == null) return;
                      mapController.move(location.latlng, 15);
                      setState(() {
                        details = location.address;
                      });
                    },
                    zoom: 15.0,
                    interactiveFlags: InteractiveFlag.none),
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
                    followOnLocationUpdate: FollowOnLocationUpdate.never,
                  ),
                  MarkerNew(address: details).centered(),
                ],
              ),
            ),
          ),
          const Spacer(),
          if (widget.address == null)
            Mutation(
                options:
                    MutationOptions(document: CREATE_ADDRESS_MUTATION_DOCUMENT),
                builder: (
                  RunMutation runMutation,
                  QueryResult? result,
                ) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (details == null || title.isEmpty)
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final args = CreateAddressArguments(
                                          input: CreateRiderAddressInput(
                                              title: title,
                                              details: details!,
                                              type: type,
                                              location: PointInput(
                                                  lat: mapController
                                                      .center.latitude,
                                                  lng: mapController
                                                      .center.longitude)))
                                      .toJson();
                                  await runMutation(args).networkResult;
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                }
                              },
                        child: Text(S.of(context).action_save)),
                  );
                }),
          if (widget.address != null)
            Mutation(
                options:
                    MutationOptions(document: UPDATE_ADDRESS_MUTATION_DOCUMENT),
                builder: (
                  RunMutation runMutation,
                  QueryResult? result,
                ) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (details == null || title.isEmpty)
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final args = UpdateAddressArguments(
                                          id: widget.address!.id,
                                          update: CreateRiderAddressInput(
                                              title: title,
                                              details: details!,
                                              type: type,
                                              location: PointInput(
                                                  lat: mapController
                                                      .center.latitude,
                                                  lng: mapController
                                                      .center.longitude)))
                                      .toJson();
                                  await runMutation(args).networkResult;
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                }
                              },
                        child: Text(S.of(context).action_save)),
                  );
                })
        ],
      ),
    );
  }

  DropdownMenuItem<RiderAddressType> createAddressType(RiderAddressType type) {
    return DropdownMenuItem(
        value: type,
        child: Row(children: [
          Icon(
            getAddressTypeIcon(type),
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(getAddressTypeName(context, type)),
        ]));
  }
}

extension AddressLocation on GetAddresses$Query$RiderAddress$Point {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}
