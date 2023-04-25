import 'package:flutter_gen/gen_l10n/messages.dart';

import 'driver_distance_select_view.dart';
import 'main_bloc.dart';
import 'query_result_view.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'graphql/generated/graphql_api.dart';
import 'order_item_view.dart';

class OrdersCarouselView extends StatelessWidget {
  final PageController carouselController = PageController();

  OrdersCarouselView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.all(16),
      child: Query(
          options: QueryOptions(
              document: AVAILABLE_ORDERS_QUERY_DOCUMENT,
              fetchPolicy: FetchPolicy.noCache),
          builder: (QueryResult result,
              {Future<QueryResult?> Function()? refetch,
              FetchMore? fetchMore}) {
            if (result.isLoading || result.hasException) {
              return QueryResultView(result);
            }
            // if ((mainBloc.state as StatusOnline).orders.length !=
            //     result.data!['availableOrders'].length) {
            //   mainBloc
            //       .add(AvailableOrdersUpdated(result.data!['availableOrders']));
            // }
            return Subscription(
                options: SubscriptionOptions(
                    document: ORDER_CREATED_SUBSCRIPTION_DOCUMENT,
                    fetchPolicy: FetchPolicy.noCache),
                builder: (QueryResult? created) {
                  if (created?.data != null) {
                    mainBloc.add(AvailabledOrderAdded(created!.data!));
                  }
                  return Subscription(
                      options: SubscriptionOptions(
                          document: ORDER_REMOVED_SUBSCRIPTION_DOCUMENT),
                      builder: (QueryResult? updated) {
                        if (updated?.data != null) {
                          mainBloc.add(AvailableOrderRemoved(updated!.data!));
                        }
                        return Mutation(
                            options: MutationOptions(
                                document:
                                    UPDATE_ORDER_STATUS_MUTATION_DOCUMENT),
                            builder: (RunMutation runMutation,
                                    QueryResult? result) =>
                                BlocBuilder<MainBloc, MainState>(
                                    builder: (context, state) {
                                  if ((state as StatusOnline).orders.isEmpty) {
                                    return const DriverDistanceSelect();
                                  }
                                  return PageView.builder(
                                      controller:
                                          PageController(viewportFraction: 0.9),
                                      itemCount: state.orders.length,
                                      onPageChanged: (index) => mainBloc
                                          .add(SelectedOrderChanged(index)),
                                      itemBuilder: (context, index) =>
                                          OrderItemView(
                                            order: state.orders[index],
                                            isActionActive:
                                                ((result?.isLoading ?? false) ==
                                                    false),
                                            onAcceptCallback:
                                                (String orderId) async {
                                              final result = await runMutation(
                                                      UpdateOrderStatusArguments(
                                                              orderId: orderId,
                                                              status: OrderStatus
                                                                  .driverAccepted)
                                                          .toJson())
                                                  .networkResult;
                                              if (result?.hasException ??
                                                  true) {
                                                final snackBar = SnackBar(
                                                    content: Text(result
                                                            ?.exception
                                                            ?.graphqlErrors
                                                            .map((e) =>
                                                                e.message)
                                                            .join(',') ??
                                                        // ignore: use_build_context_synchronously
                                                        S
                                                            .of(context)
                                                            .message_unknown_error));
                                                // ignore: use_build_context_synchronously
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                                return;
                                              }
                                              mainBloc.add(CurrentOrderUpdated(
                                                  result!.data![
                                                      'updateOneOrder']));
                                            },
                                          ));
                                }));
                      });
                });
          }),
    );
  }
}
