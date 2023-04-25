import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ridy/graphql/generated/graphql_api.graphql.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:ridy/query_result_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:ridy/trip-history/submit_complaint_view.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class TripHistoryDetailsView extends StatelessWidget {
  final String orderId;
  final MapController mapController = MapController();

  TripHistoryDetailsView({required this.orderId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(text: S.of(context).action_back),
            Expanded(
              child: Query(
                  options: QueryOptions(
                      document: GET_ORDER_DETAILS_QUERY_DOCUMENT,
                      variables:
                          GetOrderDetailsArguments(id: orderId).toJson()),
                  builder: (QueryResult result,
                      {Refetch? refetch, FetchMore? fetchMore}) {
                    if (result.isLoading || result.hasException) {
                      return QueryResultView(result);
                    }
                    final order =
                        GetOrderDetails$Query.fromJson(result.data!).order!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          DateFormat('MMM.dd.yyyy')
                              .format(order.expectedTimestamp),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(0x10000000),
                                offset: Offset(1, 2),
                                blurRadius: 20)
                          ]),
                          child: SizedBox(
                            height: 300,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: FlutterMap(
                                mapController: mapController,
                                options: MapOptions(
                                    interactiveFlags: InteractiveFlag.none,
                                    onMapReady: () {
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        mapController.fitBounds(
                                            LatLngBounds.fromPoints(order.points
                                                .map((e) => e.toLatLng())
                                                .toList()),
                                            options: const FitBoundsOptions(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 130,
                                                    vertical: 65)));
                                      });
                                    }),
                                children: [
                                  if (mapProvider ==
                                          MapProvider.openStreetMap ||
                                      (mapProvider == MapProvider.googleMap &&
                                          mapBoxAccessToken.isEmptyOrNull))
                                    openStreetTileLayer,
                                  if (mapProvider == MapProvider.mapBox ||
                                      (mapProvider == MapProvider.googleMap &&
                                          !mapBoxAccessToken.isEmptyOrNull))
                                    mapBoxTileLayer,
                                  MarkerLayer(
                                      markers: order.points
                                          .asMap()
                                          .entries
                                          .map((e) => Marker(
                                              width: 240,
                                              height: 63,
                                              point: e.value.toLatLng(),
                                              builder: (context) => MarkerNew(
                                                  address:
                                                      order.addresses[e.key])))
                                          .toList())
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: CustomTheme.primaryColors.shade100),
                          child: Row(children: [
                            Text(
                              S.of(context).order_details_payment_method_title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            Icon(
                              order.paymentGatewayId == null
                                  ? Ionicons.cash
                                  : Ionicons.globe,
                              color: CustomTheme.neutralColors,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              order.paymentGatewayId == null
                                  ? S.of(context).order_payment_method_cash
                                  : S.of(context).order_payment_method_online,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: CustomTheme.primaryColors.shade100),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  S
                                      .of(context)
                                      .order_details_trip_information_title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.navigate,
                                      color: CustomTheme.neutralColors.shade500,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        order.addresses.first,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                        order.startTimestamp != null
                                            ? DateFormat('HH:mm a')
                                                .format(order.startTimestamp!)
                                            : "-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall)
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, top: 4, bottom: 4, right: 12),
                                  child: DottedLine(
                                    direction: Axis.vertical,
                                    dashColor: CustomTheme.neutralColors,
                                    lineLength: 20,
                                    lineThickness: 2.0,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.location,
                                      color: CustomTheme.neutralColors.shade500,
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        order.addresses.last,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                        order.finishTimestamp != null
                                            ? DateFormat('HH:mm a')
                                                .format(order.finishTimestamp!)
                                            : "-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall)
                                  ],
                                )
                              ]),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  showBarModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SubmitComplaintView(orderId: orderId);
                      });
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(width: 1.5, color: Color(0xffed4346)),
                ),
                child: Text(
                  S.of(context).button_report_issue,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: const Color(0xffb20d0e)),
                ),
              ),
            )
          ],
        ));
  }
}

extension PointMixinHeper on PointMixin {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}

LatLng computeCentroid(List<LatLng> points) {
  double latitude = 0;
  double longitude = 0;
  int n = points.length;

  for (LatLng point in points) {
    latitude += point.latitude;
    longitude += point.longitude;
  }

  return LatLng(latitude / n, longitude / n);
}
