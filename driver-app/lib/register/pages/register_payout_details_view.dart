import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import '../../graphql/generated/graphql_api.dart';

class RegisterPayoutDetailsView extends StatelessWidget {
  final Function() onContinue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GetDriver$Query$Driver driver;
  final Function(bool loading) onLoadingStateUpdated;

  RegisterPayoutDetailsView(
      {Key? key,
      required this.driver,
      required this.onContinue,
      required this.onLoadingStateUpdated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).register_payout_details_title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      initialValue: driver.bankName,
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).bank_name),
                      onChanged: (value) => driver.bankName = value,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.accountNumber,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: S.of(context).account_number),
                      onChanged: (value) => driver.accountNumber = value,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.accountNumber,
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).bank_swift),
                      onChanged: (value) => driver.bankSwift = value,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.bankRoutingNumber,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: S.of(context).bankRoutingNumber),
                      onChanged: (value) => driver.bankRoutingNumber = value,
                    ),
                  ]),
            ),
          ),
          Mutation(
              options: MutationOptions(
                  document: UPDATE_PROFILE_MUTATION_DOCUMENT,
                  fetchPolicy: FetchPolicy.noCache),
              builder: (RunMutation runMutation, QueryResult? result) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? isValid = _formKey.currentState?.validate();
                      if (isValid != true) return;
                      onLoadingStateUpdated(true);
                      await runMutation({
                        "input": {
                          "bankName": driver.bankName,
                          "bankSwift": driver.bankSwift,
                          "bankRoutingNumber": driver.bankRoutingNumber,
                          "accountNumber": driver.accountNumber
                        }
                      }).networkResult;
                      onLoadingStateUpdated(false);
                      onContinue();
                    },
                    child: Text(S.of(context).action_continue),
                  ),
                );
              })
        ],
      ),
    );
  }
}
