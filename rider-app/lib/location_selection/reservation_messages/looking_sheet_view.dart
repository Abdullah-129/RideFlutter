import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../main/bloc/main_bloc.dart';

class LookingSheetView extends StatelessWidget {
  const LookingSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        top: false,
        child: Column(
          children: [
            Text(
              S.of(context).looking_dialog_title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const LinearProgressIndicator().pSymmetric(v: 8),
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                    child: Text(
                  S.of(context).looking_dialog_body,
                  style: Theme.of(context).textTheme.bodyMedium,
                ).pOnly(right: 16)),
                Flexible(
                    child: Image.asset(
                  "images/searching.png",
                ).pSymmetric(v: 8))
              ],
            ),
            Row(
              children: [
                Mutation(
                    options: MutationOptions(
                        document: CANCEL_ORDER_MUTATION_DOCUMENT),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return Expanded(
                        child: OutlinedButton(
                            onPressed: () async {
                              final net = await runMutation({}).networkResult;
                              if (net?.data == null) {
                                mainBloc.add(ResetState());
                                return;
                              }
                              final order =
                                  CancelOrder$Mutation.fromJson(net!.data!)
                                      .cancelOrder;
                              mainBloc.add(CurrentOrderUpdated(order));
                            },
                            child: Text(
                              S.of(context).action_cancel_request,
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
