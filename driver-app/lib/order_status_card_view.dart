import 'package:client_shared/components/light_colored_button.dart';
import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:client_shared/components/rounded_button.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ridy/order_invoice_view.dart';
import 'package:ridy/ride_options_sheet_view.dart';
import 'package:ridy/rider_preferences_sheet_view.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:collection/collection.dart';

import 'config.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'graphql/generated/graphql_api.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusCardView extends StatelessWidget {
  final CurrentOrderMixin order;
  const OrderStatusCardView({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    final now = DateTime.now();
    final canPay = (order.paidAmount +
            (order.rider.wallets
                    .firstWhereOrNull(
                        (element) => element.currency == order.currency)
                    ?.balance ??
                0)) >=
        order.costAfterCoupon;
    return Mutation(
        options:
            MutationOptions(document: UPDATE_ORDER_STATUS_MUTATION_DOCUMENT),
        builder: (RunMutation runMutation, QueryResult? result) {
          if (order.status == OrderStatus.waitingForPostPay) {
            return OrderInvoiceView(
                order: order,
                onCashPaymentReceived: () {
                  updateCurrentOrderStatus(
                      bloc, runMutation, OrderStatus.finished,
                      cashPayment: (order.costAfterCoupon +
                          order.tipAmount -
                          order.paidAmount));
                });
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  FloatingActionButton.extended(
                      heroTag: 'navigateFab',
                      onPressed: () => openMapsSheet(context, order),
                      elevation: 0,
                      label: Text(
                        S.of(context).order_status_action_navigate,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      icon: const Icon(Ionicons.navigate)),
                ],
              ).pSymmetric(v: 12, h: 16),
              RidySheetView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SheetTitleView(
                        title: getTitleForStatus(context, order.status)),
                    Row(
                      children: [
                        UserAvatarView(
                            urlPrefix: serverUrl,
                            url: order.rider.media?.address,
                            cornerRadius: 40,
                            size: 35),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${order.rider.firstName ?? "-"} ${order.rider.lastName ?? "-"}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                if (order.status == OrderStatus.driverAccepted)
                                  Timeago(
                                      builder: (context, text) {
                                        return Text(
                                          (order.etaPickup?.isBefore(now) ??
                                                  false)
                                              ? S
                                                  .of(context)
                                                  .rider_expected_time_past(
                                                      order.etaPickup
                                                              ?.difference(now)
                                                              .inMinutes
                                                              .abs() ??
                                                          0)
                                              : S
                                                  .of(context)
                                                  .rider_expected_time_future(
                                                      order
                                                              .etaPickup
                                                              ?.difference(
                                                                  DateTime
                                                                      .now())
                                                              .inMinutes ??
                                                          0),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        );
                                      },
                                      date: order.etaPickup ?? DateTime.now()),
                                if (order.status == OrderStatus.started ||
                                    order.status == OrderStatus.arrived)
                                  Row(
                                    children: [
                                      Icon(
                                        !canPay
                                            ? Ionicons.close_circle
                                            : Ionicons.checkmark_circle,
                                        size: 14,
                                        color: !canPay
                                            ? const Color(0xffb20d0e)
                                            : const Color(0xff108910),
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        canPay
                                            ? S
                                                .of(context)
                                                .order_payment_status_paid
                                            : S
                                                .of(context)
                                                .order_payment_status_unpaid,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                color: !canPay
                                                    ? const Color(0xffb20d0e)
                                                    : const Color(0xff108910)),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        if (order.status == OrderStatus.driverAccepted ||
                            order.status == OrderStatus.arrived)
                          RoundedButton(
                              icon: Ionicons.call,
                              onPressed: () {
                                _launchUrl(context,
                                    "tel://+${order.rider.mobileNumber}");
                              }),
                        const SizedBox(width: 8),
                        if (order.status == OrderStatus.driverAccepted ||
                            order.status == OrderStatus.arrived)
                          RoundedButton(
                              icon: Ionicons.mail,
                              onPressed: () {
                                Navigator.pushNamed(context, 'chat');
                              }),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    Row(
                      children: [
                        LightColoredButton(
                            icon: Ionicons.list,
                            text: S.of(context).action_ride_options,
                            onPressed: () async {
                              final result =
                                  await showModalBottomSheet<RideOptionsResult>(
                                      context: context,
                                      builder: (context) {
                                        return const RideOptionsSheetView();
                                      });
                              switch (result) {
                                case RideOptionsResult.cancel:
                                  updateCurrentOrderStatus(bloc, runMutation,
                                      OrderStatus.driverCanceled);
                                  break;

                                case RideOptionsResult.none:
                                case null:
                                  break;
                              }
                            }),
                        const Spacer(),
                        if (order.options.isNotEmpty)
                          LightColoredButton(
                              icon: Ionicons.options,
                              text: S.of(context).action_ride_preferences,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return RiderPreferencesSheetView(
                                        options: order.options,
                                      );
                                    });
                              }),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (order.status == OrderStatus.driverAccepted)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () => updateCurrentOrderStatus(
                                    bloc, runMutation, OrderStatus.arrived),
                            child: Text(
                                S.of(context).order_status_action_arrived)),
                      ),
                    if (order.status == OrderStatus.arrived)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () => updateCurrentOrderStatus(
                                    bloc, runMutation, OrderStatus.started),
                            child:
                                Text(S.of(context).order_status_action_start)),
                      ),
                    if (order.status == OrderStatus.started)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (result?.isLoading ?? false)
                                ? null
                                : () => updateCurrentOrderStatus(
                                    bloc, runMutation, OrderStatus.finished),
                            child: Text(
                                S.of(context).order_status_action_finished)),
                      )
                  ],
                ).px4(),
              ),
            ],
          );
        });
  }

  openMapsSheet(context, CurrentOrderMixin order) async {
    final availableMaps = await MapLauncher.installedMaps;
    String title = S.of(context).navigation_dialog_title_pickup_point;
    Coords coords = Coords(order.points.first.lat, order.points.first.lng);
    if (order.status != OrderStatus.driverAccepted &&
        order.status != OrderStatus.arrived) {
      title = S.of(context).navigation_title_destination_point;
      coords = Coords(order.points.last.lat, order.points.last.lng);
    }
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            children: [
              SheetTitleView(
                title: S.of(context).navigation_dialog_title,
                closeAction: () {
                  Navigator.pop(context);
                },
              ),
              SingleChildScrollView(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getTitleForStatus(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.driverAccepted:
        return S.of(context).order_status_card_title_driver_accepted;

      case OrderStatus.arrived:
        return S.of(context).order_status_card_title_arrived;

      case OrderStatus.started:
        return S.of(context).order_status_card_title_started;

      default:
        return "";
    }
  }

  _launchUrl(BuildContext context, String url) async {
    final canLaunch = await canLaunchUrl(Uri.parse(url));
    if (!canLaunch) {
      final snackBar =
          // ignore: use_build_context_synchronously
          SnackBar(content: Text(S.of(context).message_cant_open_url));
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    launchUrl(Uri.parse(url));
  }

  Future<void> updateCurrentOrderStatus(
      MainBloc bloc, RunMutation runMutation, OrderStatus orderStatus,
      {double? cashPayment}) async {
    final result = await runMutation(UpdateOrderStatusArguments(
                orderId: order.id,
                status: orderStatus,
                cashPayment: cashPayment ?? 0)
            .toJson())
        .networkResult;
    bloc.add(CurrentOrderUpdated(result!.data!['updateOneOrder']));
  }
}
