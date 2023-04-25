import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:ridy/main/reserve_confirmation_sheet_view.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import '../login/login_number_view.dart';
import 'bloc/jwt_cubit.dart';
import 'bloc/main_bloc.dart';
import '../main/select_service_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ServiceSelectionCardView extends StatelessWidget {
  const ServiceSelectionCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
      return Query(
          options: QueryOptions(
              document: GET_FARE_QUERY_DOCUMENT,
              variables: GetFareArguments(
                      points: (state as OrderPreview)
                          .points
                          .map((e) => PointInput(
                              lat: e.latlng.latitude, lng: e.latlng.longitude))
                          .toList(),
                      selectedOptionIds: state.selectedOptions,
                      couponCode: state.couponCode)
                  .toJson()),
          builder: (QueryResult result,
              {Future<QueryResult?> Function()? refetch,
              FetchMore? fetchMore}) {
            if (result.isLoading) {
              return Card(child: const CupertinoActivityIndicator().p16());
            }
            if (result.hasException) {
              if (result.exception!.graphqlErrors
                  .filter((element) => element.message == 'REGION_UNSUPPORTED')
                  .isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final snackBar = SnackBar(
                      content: Text(S.of(context).error_region_unsupported));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  mainBloc.add(ResetState());
                });
              }
              if (result.exception!.graphqlErrors
                  .filter((element) =>
                      element.message == 'Coupon expired' ||
                      element.message == 'Incorrect code')
                  .isNotEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  final snackBar = SnackBar(
                      content: Text(S.of(context).alert_coupon_unavailable));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  mainBloc.add(ShowPreview(
                      points: state.points,
                      selectedOptions: [],
                      couponCode: null));
                });
              }
              return Center(
                child: Text(result.exception!.graphqlErrors
                    .map((e) => e.message)
                    .join(',')),
              );
            }
            final fareResult = GetFare$Query.fromJson(result.data!).getFare;
            if ((state.directions == null || state.directions!.isEmpty) &&
                fareResult.directions.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                mainBloc.add(
                    ShowPreviewDirections(directions: fareResult.directions));
              });
            }
            if (state.selectedService == null &&
                fareResult.services.isNotEmpty &&
                fareResult.services.first.services.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                mainBloc.add(SelectService(fareResult.services[0].services[0]));
              });
            }
            return Mutation(
              options:
                  MutationOptions(document: CREATE_ORDER_MUTATION_DOCUMENT),
              builder: (RunMutation runMutation, QueryResult? result) {
                return SelectServiceView(
                  data: fareResult,
                  onServiceSelect:
                      (String serviceId, int intervalMinutes) async {
                    if (Hive.box('user').get('jwt') == null) {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          constraints: const BoxConstraints(maxWidth: 600),
                          builder: (context) {
                            return BlocProvider.value(
                              value: context.read<JWTCubit>(),
                              child: const LoginNumberView(),
                            );
                          });
                      return;
                    }
                    final fcmId = await getFcmId(context);
                    final args = CreateOrderArguments(
                            input: CreateOrderInput(
                                serviceId: int.parse(state.selectedService!.id),
                                intervalMinutes: intervalMinutes,
                                optionIds: state.selectedOptions
                                    .filter((selectedOption) => state
                                        .selectedService!.options
                                        .map((e) => e.id)
                                        .contains(selectedOption))
                                    .toList(),
                                points: state.points
                                    .map((e) => PointInput(
                                        lat: e.latlng.latitude,
                                        lng: e.latlng.longitude))
                                    .toList(),
                                couponCode: state.couponCode,
                                addresses: state.points
                                    .map((e) => e.address)
                                    .toList()),
                            notificationPlayerId: fcmId ?? "")
                        .toJson();
                    final result = await runMutation(args).networkResult;
                    if (result!.hasException) {
                      final snackBar = SnackBar(
                          content: Text(result.exception?.graphqlErrors
                                  .map((e) => e.message)
                                  .join(', ') ??
                              "Unknown error"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    final order =
                        CreateOrder$Mutation.fromJson(result.data!).createOrder;
                    if (order.status == OrderStatus.booked) {
                      await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const ReserveConfirmationSheetView();
                          });
                      mainBloc.add(ResetState());
                    } else {
                      mainBloc.add(CurrentOrderUpdated(order));
                    }
                  },
                );
              },
            );
          });
    });
  }
}

Future<String?> getFcmId(BuildContext context) async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.denied) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(S.of(context).message_notification_permission_title),
              content: Text(S
                  .of(context)
                  .message_notification_permission_denined_message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).action_ok),
                )
              ],
            ));
    return null;
  } else {
    return messaging.getToken(
      vapidKey: "",
    );
  }
}
