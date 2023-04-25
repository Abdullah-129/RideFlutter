import 'package:client_shared/components/ridy_sheet_view.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ridy/config.dart';
import 'package:ridy/current_location_cubit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'graphql/generated/graphql_api.dart';
import 'package:intl/intl.dart';

class OrderItemView extends StatelessWidget {
  final AvailableOrderMixin order;
  final OrderAcceptedCallback onAcceptCallback;
  final bool isActionActive;
  const OrderItemView(
      {Key? key,
      required this.order,
      required this.onAcceptCallback,
      required this.isActionActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocationCubit, CurrentLocationState>(
        builder: (context, state) {
      final driverDistance = state.location == null
          ? order.distanceBest
          : (Geolocator.distanceBetween(
                  state.location!.latitude,
                  state.location!.longitude,
                  order.points.first.lat,
                  order.points.first.lng) /
              1000);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: RidySheetView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  UserAvatarView(
                      urlPrefix: serverUrl,
                      url: null,
                      cornerRadius: 60,
                      size: 30),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.service.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        S.of(context).request_card_distance(
                            (driverDistance / 1000).round()),
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: CustomTheme.primaryColors.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      NumberFormat.simpleCurrency(name: order.currency)
                          .format(order.costBest),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  )
                ],
              ),
              const Divider(),
              ...order.addresses.mapIndexed((e, index) {
                if (order.addresses.length > 2 &&
                    index > 0 &&
                    index != order.addresses.length - 1) {
                  return const SizedBox(
                    width: 1,
                    height: 1,
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              getIconByIndex(index, order.addresses.length),
                              color: CustomTheme.neutralColors.shade500,
                            ),
                          ),
                          Expanded(
                            child: Text(e,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                          if (index == order.addresses.length - 1)
                            Text(
                                order.durationBest == 0
                                    ? ""
                                    : durationToString(
                                        Duration(seconds: order.durationBest)),
                                style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ),
                    if (index < order.addresses.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DottedLine(
                            direction: Axis.vertical,
                            lineLength: 20,
                            lineThickness: 3,
                            dashLength: 3,
                            dashColor: CustomTheme.neutralColors.shade500),
                      )
                  ],
                );
              }).toList(),
              const Spacer(),
              Row(
                  children: order.options
                      .map((e) => OrderPreferenceTagView(
                            icon: e.icon,
                            name: e.name,
                          ))
                      .toList()),
              ElevatedButton(
                      onPressed: !isActionActive
                          ? null
                          : () => onAcceptCallback(order.id),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(S.of(context).available_order_action_accept),
                          const Spacer()
                        ],
                      ).p4())
                  .p4()
            ],
          ),
        ),
      );
    });
  }

  IconData getIconByIndex(int index, int length) {
    if (index == 0) {
      return Ionicons.navigate;
    } else if (index == length - 1) {
      return Ionicons.location;
    } else {}
    return Ionicons.flag;
  }
}

typedef OrderAcceptedCallback = void Function(String orderId);

String durationToString(Duration duration) =>
    ("in ${duration.inMinutes.toStringAsFixed(0)} mins");

class OrderPreferenceTagView extends StatelessWidget {
  final ServiceOptionIcon icon;
  final String name;

  const OrderPreferenceTagView(
      {required this.icon, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: CustomTheme.neutralColors.shade100,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: CustomTheme.primaryColors,
                  borderRadius: BorderRadius.circular(16)),
              child: Icon(
                getOptionIcon(),
                size: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              name,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  IconData getOptionIcon() {
    switch (icon) {
      case ServiceOptionIcon.pet:
        return Ionicons.paw;

      case ServiceOptionIcon.twoWay:
        return Ionicons.repeat;

      case ServiceOptionIcon.luggage:
        return Ionicons.briefcase;

      case ServiceOptionIcon.packageDelivery:
        return Ionicons.cube;

      case ServiceOptionIcon.shopping:
        return Ionicons.cart;

      case ServiceOptionIcon.custom1:
        return Ionicons.help;

      case ServiceOptionIcon.custom2:
        return Ionicons.help;

      case ServiceOptionIcon.custom3:
        return Ionicons.help;

      case ServiceOptionIcon.custom4:
        return Ionicons.help;

      case ServiceOptionIcon.custom5:
        return Ionicons.help;

      case ServiceOptionIcon.artemisUnknown:
        return Ionicons.help;
    }
  }
}
