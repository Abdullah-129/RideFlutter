import 'package:client_shared/components/ride_option_item.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class RideSafetySheetView extends StatelessWidget {
  final CurrentOrderMixin order;
  const RideSafetySheetView({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
              title: S.of(context).ride_safety_title,
              closeAction: () => Navigator.pop(context),
            ),
            RideOptionItem(
                icon: Ionicons.shield,
                text: S.of(context).ride_safety_share_trip_information,
                onPressed: () {
                  Navigator.pop(context);
                  var text = S.of(context).share_trip_text_locations(
                      order.addresses.last, order.addresses.first);
                  if (order.driver != null) {
                    text += S.of(context).share_trip_text_driver(
                        order.driver!.firstName ?? "",
                        order.driver!.lastName ?? "",
                        order.driver!.mobileNumber);
                  }
                  if (order.startTimestamp != null) {
                    text += S.of(context).share_trip_started_time(
                        DateFormat('HH:mm a').format(order.startTimestamp!),
                        (order.durationBest / 60) + order.waitMinutes);
                  } else {
                    text += S.of(context).share_trip_not_arrived_time(
                        (order.durationBest / 60) + order.waitMinutes);
                  }
                  Share.share(text);
                }),
            const SizedBox(height: 8),
            Mutation(
                options:
                    MutationOptions(document: SEND_S_O_S_MUTATION_DOCUMENT),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return RideOptionItem(
                      icon: Ionicons.warning,
                      text: S.of(context).ride_safety_sos,
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(S.of(context).sos_title),
                                content: Text(S.of(context).sos_body),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        final distressArgs =
                                            SendSOSArguments(orderId: order.id)
                                                .toJson();
                                        await runMutation(distressArgs)
                                            .networkResult;
                                        final snackBar = SnackBar(
                                            content: Text(
                                                S.of(context).sos_sent_alert));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        S.of(context).sos_ok_action,
                                        style:
                                            TextStyle(color: Color(0xffb20d0e)),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(S.of(context).action_cancel))
                                ],
                              );
                            });
                      });
                }),
          ],
        ));
  }
}
