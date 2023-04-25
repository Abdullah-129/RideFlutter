import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

import 'package:client_shared/theme/theme.dart';

import 'bloc/main_bloc.dart';

class ServiceItemView extends StatelessWidget {
  final bool isSelected;
  final GetFare$Query$CalculateFareDTO$ServiceCategory$Service service;
  final String currency;

  const ServiceItemView(
      {Key? key,
      required this.isSelected,
      required this.service,
      required this.currency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return GestureDetector(
      onTap: () => mainBloc.add(SelectService(service)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected
                ? CustomTheme.primaryColors.shade100
                : CustomTheme.primaryColors.shade50),
        child: Row(
          children: [
            Image.network(
              serverUrl + service.media.address,
              width: 75,
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (service.description?.isNotEmpty ?? false)
                    Text(
                      service.description ?? "",
                      style: Theme.of(context).textTheme.labelMedium,
                    ).pOnly(top: 4)
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  NumberFormat.simpleCurrency(name: currency)
                      .format(service.cost),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      decoration: (service.costAfterCoupon != null &&
                              service.cost != service.costAfterCoupon)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: (service.costAfterCoupon != null &&
                              service.cost != service.costAfterCoupon)
                          ? CustomTheme.neutralColors.shade300
                          : CustomTheme.neutralColors.shade800),
                ),
                if (service.costAfterCoupon != null &&
                    service.cost != service.costAfterCoupon)
                  Text(
                    NumberFormat.simpleCurrency(name: currency)
                        .format(service.costAfterCoupon),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: const Color(0xff108910)),
                  ).pOnly(top: 4)
              ],
            ).pOnly(top: 4, right: 8)
          ],
        ),
      ),
    );
  }
}
