import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import 'package:ridy/graphql/generated/graphql_api.graphql.dart';
import 'package:client_shared/theme/theme.dart';

class AddressItemView extends StatelessWidget {
  final RiderAddressType type;
  final GetAddresses$Query$RiderAddress? address;

  final Function(
          GetAddresses$Query$RiderAddress? address, RiderAddressType? type)
      onAction;

  const AddressItemView(
      {required this.onAction, required this.type, this.address, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          AddressListIcon(getAddressTypeIcon(type)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getAddressTypeName(context, type),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (address != null)
                  Text(
                    address!.details,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                if (address == null)
                  CupertinoButton(
                      padding: const EdgeInsets.only(left: 0, top: 2),
                      minSize: 0,
                      child: Text(S.of(context).action_set_location,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: CustomTheme.primaryColors)),
                      onPressed: () => onAction(null, type))
              ],
            ),
          ),
          const Spacer(),
          if (address != null)
            CupertinoButton(
                child: Text(
                  S.of(context).action_edit,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                onPressed: () => onAction(address, null))
        ],
      ),
    );
  }
}

class AddressListIcon extends StatelessWidget {
  final IconData iconData;
  const AddressListIcon(
    this.iconData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: CustomTheme.neutralColors.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        iconData,
        size: 28,
        color: CustomTheme.neutralColors.shade600,
      ),
    );
  }
}

IconData getAddressTypeIcon(RiderAddressType type) {
  switch (type) {
    case RiderAddressType.home:
      return Ionicons.home;

    case RiderAddressType.work:
      return Ionicons.business;

    case RiderAddressType.partner:
      return Ionicons.heart;

    case RiderAddressType.other:
      return Ionicons.location;

    case RiderAddressType.artemisUnknown:
      return Ionicons.location;
    case RiderAddressType.gym:
      return Ionicons.barbell;

    case RiderAddressType.parent:
      return Ionicons.people;

    case RiderAddressType.cafe:
      return Ionicons.cafe;

    case RiderAddressType.park:
      return Ionicons.leaf;
  }
}

String getAddressTypeName(BuildContext context, RiderAddressType type) {
  switch (type) {
    case RiderAddressType.home:
      return S.of(context).enum_address_type_home;

    case RiderAddressType.work:
      return S.of(context).enum_address_type_work;

    case RiderAddressType.partner:
      return S.of(context).enum_address_type_partner;

    case RiderAddressType.other:
      return S.of(context).enum_address_type_other;

    case RiderAddressType.artemisUnknown:
      return S.of(context).enum_address_type_other;

    case RiderAddressType.gym:
      return S.of(context).enum_address_type_gym;

    case RiderAddressType.parent:
      return S.of(context).enum_address_type_parent_house;

    case RiderAddressType.cafe:
      return S.of(context).enum_address_type_cafe;

    case RiderAddressType.park:
      return S.of(context).enum_address_type_park;
  }
}
