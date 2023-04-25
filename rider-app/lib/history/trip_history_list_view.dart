import 'package:client_shared/components/empty_state_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client_shared/components/back_button.dart';
import 'package:ridy/history/trip_history_details_view.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../query_result_view.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:client_shared/components/trip_history_item_view.dart';

class TripHistoryListView extends StatefulWidget {
  const TripHistoryListView({Key? key}) : super(key: key);

  @override
  State<TripHistoryListView> createState() => _TripHistoryListViewState();
}

class _TripHistoryListViewState extends State<TripHistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RidyBackButton(text: S.of(context).action_back),
            const SizedBox(height: 16),
            Query(
              options: QueryOptions(
                  document: GET_HISTORY_QUERY_DOCUMENT,
                  fetchPolicy: FetchPolicy.noCache),
              builder: (QueryResult result,
                  {Refetch? refetch, FetchMore? fetchMore}) {
                if (result.hasException || result.isLoading) {
                  return Expanded(child: QueryResultView(result));
                }
                final query = GetHistory$Query.fromJson(result.data!);
                final orders = query.orders.edges;
                if (orders.isEmpty) {
                  return EmptyStateCard(
                    title: S.of(context).trip_history_empty_state_title,
                    description: S.of(context).trip_history_empty_state_message,
                    icon: Ionicons.cloud_offline,
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final item = orders[index].node;
                        return TripHistoryItemView(
                            id: item.id,
                            canceledText: S.of(context).order_status_canceled,
                            title: item.service.name,
                            dateTime: item.createdOn,
                            currency: item.currency,
                            price: item.costAfterCoupon,
                            isCanceled:
                                item.status == OrderStatus.riderCanceled ||
                                    item.status == OrderStatus.driverCanceled,
                            onPressed: (id) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      TripHistoryDetailsView(orderId: id),
                                ),
                              );
                              // showBarModalBottomSheet(
                              //     context: context,
                              //     builder: (context) {
                              //       return TripHistoryDetailsView(
                              //         orderId: id,
                              //       );
                              //     });
                            });
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
