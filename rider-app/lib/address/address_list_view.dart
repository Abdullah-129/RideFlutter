import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/address/address_details_view.dart';
import 'package:ridy/address/address_item_view.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:ridy/main/bloc/current_location_cubit.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import '../graphql/generated/graphql_api.graphql.dart';
import '../query_result_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddressListView extends StatefulWidget {
  const AddressListView({Key? key}) : super(key: key);

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  List<GetAddresses$Query$RiderAddress> allAddresses = [];
  Refetch? refetch;
  List<RiderAddressType> defaultTypes = [
    RiderAddressType.home,
    RiderAddressType.work,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Query(
          options: QueryOptions(
              document: GET_ADDRESSES_QUERY_DOCUMENT,
              fetchPolicy: FetchPolicy.noCache),
          builder: (QueryResult result,
              {Future<QueryResult?> Function()? refetch,
              FetchMore? fetchMore}) {
            if (result.isLoading || result.hasException) {
              return QueryResultView(result);
            }
            this.refetch = refetch;
            allAddresses =
                GetAddresses$Query.fromJson(result.data!).riderAddresses;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RidyBackButton(text: S.of(context).action_back),
                const SizedBox(height: 16),
                Text(
                  S.of(context).favorite_locations_list_title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  S.of(context).favorite_locations_list_body,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                ...defaultTypes.map(
                  (e) {
                    final ind =
                        allAddresses.indexWhere((element) => element.type == e);
                    if (ind < 0) {
                      return AddressItemView(
                        onAction: (address, type) =>
                            showAddressDetailsView(context, address, type),
                        type: e,
                        address: null,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                ...allAddresses.map((e) {
                  return AddressItemView(
                    onAction: (address, type) =>
                        showAddressDetailsView(context, address, type),
                    type: e.type,
                    address: e,
                  );
                }),
                const Divider(),
                AddressListAddLocationButton(
                    onTap: () => showAddressDetailsView(context, null, null)),
              ],
            );
          },
        ),
      ),
    );
  }

  void showAddressDetailsView(BuildContext context,
      GetAddresses$Query$RiderAddress? address, RiderAddressType? type) async {
    final currentLocation = context.read<CurrentLocationCubit>().state;
    await showBarModalBottomSheet(
        context: context,
        builder: (_) {
          return BlocProvider.value(
              value: BlocProvider.of<CurrentLocationCubit>(context),
              child: AddressDetailsView(
                  address: address,
                  defaultType: type,
                  currentLocation: currentLocation));
        });
    refetch!();
  }
}

class AddressListAddLocationButton extends StatelessWidget {
  final Function() onTap;
  const AddressListAddLocationButton({required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 8),
        onPressed: onTap,
        child: Row(children: [
          const AddressListIcon(Icons.add),
          const SizedBox(width: 8),
          Text(
            S.of(context).action_add_favorite_location,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ]));
  }
}
