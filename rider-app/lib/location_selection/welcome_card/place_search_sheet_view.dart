import 'dart:async';

import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:ridy/location_selection/welcome_card/place_confirm_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:latlong2/latlong.dart' as lat_lng;

import '../../config.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

class PlaceSearchSheetView extends StatelessWidget {
  final FullLocation? currentLocation;

  const PlaceSearchSheetView(this.currentLocation, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuggestionsCubit(),
      child: PlaceSearchSheetViewChild(currentLocation),
    );
  }
}

class PlaceSearchSheetViewChild extends StatefulWidget {
  final FullLocation? currentLocation;

  const PlaceSearchSheetViewChild(this.currentLocation, {Key? key})
      : super(key: key);

  @override
  State<PlaceSearchSheetViewChild> createState() =>
      _PlaceSearchSheetViewChildState();
}

class _PlaceSearchSheetViewChildState extends State<PlaceSearchSheetViewChild> {
  bool showChooseOnMap = true;
  Timer? _debounce;
  List<FullLocation?> selectedLocations = [];

  int selectedIndex = 1;

  @override
  initState() {
    selectedIndex = widget.currentLocation == null ? 0 : 1;
    selectedLocations = [null, null];
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            splashRadius: 20,
          )
        ]),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomTheme.neutralColors.shade100),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                  children: selectedLocations.mapIndexed((e, index) {
                return Column(
                  children: [
                    Icon(
                      index == 0
                          ? Ionicons.navigate
                          : (index == selectedLocations.length - 1
                              ? Ionicons.location
                              : Ionicons.flag),
                      color: index == selectedLocations.length - 1
                          ? CustomTheme.primaryColors
                          : CustomTheme.neutralColors,
                    ).p4(),
                    if (index != selectedLocations.length - 1)
                      const DottedLine(
                        direction: Axis.vertical,
                        dashColor: CustomTheme.neutralColors,
                        lineLength: 20,
                        lineThickness: 2.0,
                      )
                  ],
                );
              }).toList()),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...selectedLocations.mapIndexed((location, index) {
                      final suggestionsCubit = context.read<SuggestionsCubit>();
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  autofocus: widget.currentLocation == null
                                      ? index == 0
                                      : index == 1,
                                  controller: TextEditingController(
                                      text: location?.address),
                                  onTap: (() {
                                    setState(() {
                                      if (!showChooseOnMap) {
                                        showChooseOnMap = true;
                                      }
                                    });
                                    selectedIndex = index;
                                  }),
                                  onChanged: (value) async {
                                    if (value.isEmptyOrNull &&
                                        suggestionsCubit
                                            .state.suggestions.isNotEmpty) {
                                      suggestionsCubit.clearSuggestions();
                                      return;
                                    }
                                    if (!value.isEmptyOrNull) {
                                      if (_debounce?.isActive ?? false) {
                                        _debounce?.cancel();
                                      }
                                      _debounce = Timer(
                                          const Duration(milliseconds: 500),
                                          () async {
                                        if (mapProvider == MapProvider.mapBox ||
                                            mapProvider ==
                                                MapProvider.openStreetMap) {
                                          final res =
                                              await Nominatim.searchByName(
                                                  query: value,
                                                  countryCodes:
                                                      nominatimCountries,
                                                  addressDetails: true,
                                                  nameDetails: true);

                                          if (mounted) {
                                            suggestionsCubit.showSuggestions(res
                                                .map((e) =>
                                                    e.convertToFullLocation())
                                                .toList());
                                          }
                                        } else if (mapProvider ==
                                            MapProvider.googleMap) {
                                          final placesAPI = GoogleMapsPlaces(
                                            apiKey: placesApiKey,
                                            apiHeaders:
                                                await const GoogleApiHeaders()
                                                    .getHeaders(),
                                          );
                                          final placesPredictions =
                                              await placesAPI
                                                  .autocomplete(value);
                                          final fullLocations =
                                              placesPredictions.predictions
                                                  .filter((element) =>
                                                      element.placeId != null)
                                                  .map((e) async {
                                            final detail = await placesAPI
                                                .getDetailsByPlaceId(
                                                    e.placeId!);
                                            final location = detail
                                                .result.geometry!.location;
                                            return FullLocation(
                                                latlng: lat_lng.LatLng(
                                                    location.lat, location.lng),
                                                address: e.description ?? "",
                                                title: detail.result.name);
                                          }).toList();
                                          final awaitedLocations =
                                              await Future.wait(fullLocations);
                                          if (mounted) {
                                            suggestionsCubit.showSuggestions(
                                                awaitedLocations);
                                          }
                                        }
                                      });
                                    }
                                  },
                                  decoration: noBorderInputDecoration.copyWith(
                                      hintText: index == 0
                                          ? S.of(context).current_location
                                          : (index <
                                                  selectedLocations.length - 1
                                              ? S.of(context).add_stop
                                              : S.of(context).your_destination),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: index ==
                                                      selectedLocations.length -
                                                          1
                                                  ? CustomTheme.primaryColors
                                                  : CustomTheme.neutralColors)),
                                ),
                              ),
                              if (index == selectedLocations.length - 1 &&
                                  selectedLocations.length < 5)
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedLocations = selectedLocations
                                          .followedBy([null]).toList();
                                    });
                                  },
                                  padding: const EdgeInsets.all(4),
                                  minSize: 0,
                                  child: const Icon(
                                    Icons.add,
                                    color: CustomTheme.neutralColors,
                                  ),
                                ),
                              if (index > 0 &&
                                  index < selectedLocations.length - 1)
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedLocations = [
                                        selectedLocations.first,
                                        ...selectedLocations.sublist(2)
                                      ];
                                    });
                                  },
                                  padding: const EdgeInsets.all(4),
                                  minSize: 0,
                                  child: const Icon(
                                    Icons.remove,
                                    color: CustomTheme.neutralColors,
                                  ),
                                )
                            ],
                          ),
                          if (index < selectedLocations.length - 1)
                            const Divider(),
                        ],
                      );
                    }),
                  ],
                ),
              )
            ],
          ).p4(),
        ).pOnly(right: 12, left: 12, bottom: 8),
        Container(
          height: 8,
          decoration:
              BoxDecoration(color: Colors.grey.shade50, boxShadow: const [
            BoxShadow(
                color: Color(0x0f000000),
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 0)
          ]),
        ),
        if (showChooseOnMap)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  spreadRadius: -1,
                  offset: const Offset(0, -3)),
              const BoxShadow(
                  color: Color(0xfff2f5fa), blurRadius: 10, spreadRadius: 5),
            ]),
            child: Center(
              child: CupertinoButton(
                onPressed: () async {
                  final result = await showBarModalBottomSheet<FullLocation>(
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return PlaceConfirmSheetView(widget.currentLocation);
                      });
                  if (result == null) return;
                  setLocation(result);
                },
                minSize: 0,
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Ionicons.locate,
                      color: CustomTheme.neutralColors.shade600,
                    ).pOnly(right: 8),
                    Text(
                      S.of(context).action_choose_on_map,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: CustomTheme.neutralColors.shade600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Container(
          height: 10,
          color: Colors.grey.shade50,
        ),
        BlocBuilder<SuggestionsCubit, SuggestionsState>(
            builder: (context, state) {
          if (state.suggestions.isEmpty) {
            return const SizedBox();
            // return Expanded(
            //   child: ValueListenableBuilder(
            //     valueListenable: Hive.box<List<LocationHistoryItem>>("history2")
            //         .listenable(),
            //     builder: (context, Box box, widget) => ListView.builder(
            //         itemCount: (box.get("items",
            //                     defaultValue:
            //                         List<LocationHistoryItem>.from([]))
            //                 as List<LocationHistoryItem>)
            //             .length,
            //         itemBuilder: (context, index) {
            //           final historyItem = box.get("items",
            //                   defaultValue:
            //                       List<LocationHistoryItem>.from([]))[index]
            //               as LocationHistoryItem;
            //           return _recentSearch(
            //               context,
            //               FullLocation(
            //                   latlng: historyItem.toLatLng(),
            //                   address: historyItem.details,
            //                   title: historyItem.name),
            //               true,
            //               (location) => setLocation(location));
            //         }),
            //   ),
            // );
          } else {
            return Expanded(
              child: ListView.builder(
                  itemCount: state.suggestions.length,
                  itemBuilder: ((context, index) {
                    return LocationSearchResultItem(
                        location: state.suggestions[index],
                        isHistory: false,
                        onSelected: (location) => setLocation(location));
                  })),
            );
          }
        })
      ],
    );
  }

  void setLocation(FullLocation location) {
    selectedLocations[selectedIndex] = location;
    if (selectedLocations
            .withoutFirst()
            .toList()
            .indexWhere((element) => element == null) <
        0) {
      if (selectedLocations[0] == null && widget.currentLocation == null) {
        showPickupLocationCanNotBeEmptyDialog(context);
        return;
      }
      final List<FullLocation> locations = [
        selectedLocations[0] ?? widget.currentLocation!,
        ...(selectedLocations.withoutFirst()).whereType<FullLocation>()
      ];

      Navigator.pop(context, locations);
      return;
    }
    setState(() {
      selectedLocations[selectedIndex] = location;
    });
  }

  void showPickupLocationCanNotBeEmptyDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).message_title_location),
            content: Text(S.of(context).message_body_location),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text(S.of(context).action_ok, textAlign: TextAlign.end))
            ],
          );
        });
  }
}

class LocationSearchResultItem extends StatelessWidget {
  final FullLocation location;
  final bool isHistory;
  final Function(FullLocation) onSelected;

  const LocationSearchResultItem(
      {required this.location,
      required this.isHistory,
      required this.onSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () async {
        final result = await showBarModalBottomSheet<FullLocation>(
            context: context,
            enableDrag: false,
            builder: (context) {
              return PlaceConfirmSheetView(location);
            });
        if (result == null) return;
        onSelected(result);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isHistory ? Ionicons.time : Ionicons.compass,
                color: CustomTheme.neutralColors.shade400,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ).pOnly(bottom: 4),
                    Text(
                      location.address,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ).pOnly(left: 16),
              )
            ],
          ).pSymmetric(h: 16, v: 8),
          const Divider()
        ],
      ),
    );
  }
}

const noBorderInputDecoration = InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.all(8),
    filled: false,
    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none));

class FullLocation {
  String title;
  String address;
  LatLng latlng;

  FullLocation(
      {required this.latlng, required this.address, required this.title});
}

extension ConvertToFullLocation on Place {
  FullLocation convertToFullLocation() {
    return FullLocation(
        latlng: LatLng(lat, lon),
        address: displayName,
        title: nameDetails?['name'] ?? "Unknown");
  }
}

class SuggestionsCubit extends Cubit<SuggestionsState> {
  SuggestionsCubit() : super(SuggestionsState([]));

  void clearSuggestions() => emit(SuggestionsState([]));

  void showSuggestions(List<FullLocation> suggestions) =>
      emit(SuggestionsState(suggestions));
}

class SuggestionsState {
  List<FullLocation> suggestions = [];

  SuggestionsState(this.suggestions);
}
