import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:client_shared/components/light_colored_button.dart';
import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:client_shared/components/rounded_button.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ridy/main/enter_coupon_code_sheet_view.dart';
import 'package:ridy/main/enter_gift_code_sheet_view.dart';
import 'package:ridy/main/pay_for_ride_sheet_view.dart';
import 'package:ridy/main/ride_options_sheet_view.dart';
import 'package:ridy/main/ride_safety_sheet_view.dart';
import 'package:ridy/main/wait_time_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';
import '../config.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'bloc/main_bloc.dart';

class OrderStatusSheetView extends StatelessWidget {
  const OrderStatusSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final mainBloc = context.read<MainBloc>();
    return Subscription(
        options: SubscriptionOptions(
            document: DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT,
            fetchPolicy: FetchPolicy.noCache),
        builder: (QueryResult result) {
          if (result.data != null) {
            final location =
                DriverLocationUpdated$Subscription.fromJson(result.data!);
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              mainBloc.add(
                  DriverLocationUpdatedEvent(location.driverLocationUpdated));
            });
          }
          return RidySheetView(child: BlocBuilder<MainBloc, MainBlocState>(
            builder: (context, state) {
              state as OrderInProgress;
              return Column(
                children: [
                  if (state.order.status == OrderStatus.driverAccepted)
                    Timeago(
                      builder: (_, value) => SheetTitleView(
                          title:
                              ((state.order.etaPickup ?? now).isBefore(now) ||
                                      state.order.etaPickup == null)
                                  ? S.of(context).order_status_should_be_arrived
                                  : S.of(context).order_status_arriving_in(state
                                          .order.etaPickup
                                          ?.difference(DateTime.now())
                                          .inMinutes ??
                                      0)),
                      date: state.order.etaPickup ?? now,
                      allowFromNow: true,
                    )
                  else if (state.order.status == OrderStatus.arrived)
                    SheetTitleView(
                        title: S.of(context).status_title_driver_arrived)
                  else if (state.order.status == OrderStatus.started)
                    SheetTitleView(
                        title: S.of(context).status_title_trip_started),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.order.driver?.car?.name ?? "",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: CustomTheme.primaryColors.shade400,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                state.order.driver?.carPlate ?? "",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ]),
                      const Spacer(),
                      Stack(
                        children: [
                          Image.network(
                                  serverUrl + state.order.service.media.address,
                                  width: 117,
                                  height: 70)
                              .pOnly(bottom: 16),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                              decoration: BoxDecoration(
                                  color: CustomTheme.primaryColors.shade400,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                NumberFormat.simpleCurrency(
                                        name: state.order.currency)
                                    .format(state.currentOrder.costAfterCoupon),
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                                softWrap: false,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserAvatarView(
                        urlPrefix: serverUrl,
                        url: state.order.driver?.media?.address,
                        size: 50,
                        cornerRadius: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${state.order.driver!.firstName} ${state.order.driver!.lastName}",
                                  style: Theme.of(context).textTheme.bodySmall)
                              .pOnly(left: 4, bottom: 4),
                          if (state.order.driver?.rating != null)
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffe6bb4d),
                                ),
                                Text(
                                  (state.order.driver!.rating!.toDouble() / 20)
                                      .toStringAsFixed(1),
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ).pOnly(left: 4)
                              ],
                            )
                        ],
                      ),
                      const Spacer(),
                      RoundedButton(
                          icon: Ionicons.mail,
                          onPressed: () =>
                              Navigator.pushNamed(context, 'chat')),
                      const SizedBox(width: 8),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: RoundedButton(
                            icon: Ionicons.call,
                            onPressed: () => _launchUrl(context,
                                "tel://+${state.order.driver?.mobileNumber}")),
                      ),
                    ],
                  ).pSymmetric(v: 8),
                  const Divider(),
                  Row(
                    children: [
                      Mutation(
                          options: MutationOptions(
                              document: UPDATE_ORDER_MUTATION_DOCUMENT,
                              fetchPolicy: FetchPolicy.noCache),
                          builder:
                              (RunMutation runMutation, QueryResult? result) {
                            if (result?.data != null) {
                              final order =
                                  UpdateOrder$Mutation.fromJson(result!.data!)
                                      .updateOneOrder;
                              mainBloc.add(CurrentOrderUpdated(order));
                            }
                            return LightColoredButton(
                                icon: Ionicons.list,
                                text: S.of(context).action_ride_options,
                                onPressed: () async {
                                  final result = await showModalBottomSheet<
                                          RideOptionsResult>(
                                      context: context,
                                      builder: (context) {
                                        return const RideOptionsSheetView();
                                      });
                                  switch (result) {
                                    case RideOptionsResult.waitTime:
                                      final result =
                                          await showModalBottomSheet<int>(
                                              context: context,
                                              builder: (context) {
                                                return WaitTimeSheetView(
                                                  selectedMinute:
                                                      state.order.waitMinutes,
                                                );
                                              });
                                      if (result == null) return;
                                      await runMutation(UpdateOrderArguments(
                                                  id: state.order.id,
                                                  update: UpdateOrderInput(
                                                      waitMinutes: result))
                                              .toJson())
                                          .networkResult;
                                      break;

                                    case null:
                                    case RideOptionsResult.none:
                                      return;

                                    case RideOptionsResult.couponCode:
                                      final result =
                                          await showModalBottomSheet<String>(
                                              context: context,
                                              isScrollControlled: true,
                                              constraints: const BoxConstraints(
                                                  maxWidth: 600),
                                              builder: (context) {
                                                return const EnterCouponCodeSheetView();
                                              });
                                      if (result == null) return;
                                      await runMutation(UpdateOrderArguments(
                                                  id: state.order.id,
                                                  update: UpdateOrderInput(
                                                      couponCode: result))
                                              .toJson())
                                          .networkResult;
                                      break;
                                    case RideOptionsResult.giftCode:
                                      await showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return const EnterGiftCodeSheetView();
                                          });
                                      break;
                                    case RideOptionsResult.cancel:
                                      if (state.order.service
                                              .cancellationTotalFee >
                                          0) {
                                        final cancelFee =
                                            NumberFormat.simpleCurrency(
                                                    name: state.order.currency)
                                                .format(state.order.service
                                                    .cancellationTotalFee);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(S
                                                    .of(context)
                                                    .message_title_warning),
                                                content: Text(S
                                                    .of(context)
                                                    .cancelation_fee_confirmation_body(
                                                        cancelFee)),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(),
                                                      child: Text(S
                                                          .of(context)
                                                          .action_cancel)),
                                                  TextButton(
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();
                                                        final result = await runMutation(UpdateOrderArguments(
                                                                    id: state
                                                                        .order
                                                                        .id,
                                                                    update: UpdateOrderInput(
                                                                        status: OrderStatus
                                                                            .riderCanceled,
                                                                        tipAmount:
                                                                            0,
                                                                        waitMinutes:
                                                                            0))
                                                                .toJson())
                                                            .networkResult;
                                                        final order =
                                                            UpdateOrder$Mutation
                                                                .fromJson(
                                                                    result!
                                                                        .data!);
                                                        mainBloc.add(
                                                            CurrentOrderUpdated(
                                                                order
                                                                    .updateOneOrder));
                                                      },
                                                      child: Text(S
                                                          .of(context)
                                                          .action_confirm))
                                                ],
                                              );
                                            });
                                      } else {
                                        final result = await runMutation(
                                                UpdateOrderArguments(
                                                        id: state.order.id,
                                                        update: UpdateOrderInput(
                                                            status: OrderStatus
                                                                .riderCanceled,
                                                            waitMinutes: 0,
                                                            tipAmount: 0))
                                                    .toJson())
                                            .networkResult;
                                        final order =
                                            UpdateOrder$Mutation.fromJson(
                                                result!.data!);
                                        mainBloc.add(CurrentOrderUpdated(
                                            order.updateOneOrder));
                                      }
                                      break;
                                  }
                                }).pSymmetric(v: 4);
                          }),
                      const Spacer(),
                      LightColoredButton(
                          icon: Ionicons.shield,
                          text: S.of(context).button_ride_safety,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return RideSafetySheetView(
                                      order: state.order);
                                });
                          }).pSymmetric(v: 4),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          showBarModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return PayForRideSheetView(
                                  onClosePressed: () => Navigator.pop(context),
                                  order: state.order,
                                );
                              });
                        },
                        child: Text(S.of(context).action_pay_for_ride),
                      ))
                    ],
                  )
                ],
              );
            },
          ));
        });
  }

  _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final canLaunch = await canLaunchUrl(uri);
    if (!canLaunch) {
      const snackBar = SnackBar(content: Text("Command is not supported"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    launchUrl(uri);
  }
}
