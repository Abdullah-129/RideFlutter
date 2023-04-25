import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import '../../graphql/generated/graphql_api.graphql.dart';

class RegisterContactDetailsView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GetDriver$Query$Driver driver;
  final Function() onContinue;
  final Function(bool loading) onLoadingStateUpdated;

  RegisterContactDetailsView(
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
                      S.of(context).register_contact_details_title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: DropdownButtonFormField<Gender>(
                        value: driver.gender,
                        decoration: InputDecoration(
                            isDense: true, labelText: S.of(context).gender),
                        items: <DropdownMenuItem<Gender>>[
                          DropdownMenuItem(
                            value: Gender.male,
                            child: Text(S.of(context).gender_male),
                          ),
                          DropdownMenuItem(
                              value: Gender.female,
                              child: Text(S.of(context).gender_female))
                        ],
                        onChanged: (Gender? value) {
                          driver.gender = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.firstName,
                      onChanged: (value) => driver.firstName = value,
                      validator: (value) {
                        if (value.isEmptyOrNull) {
                          return S.of(context).form_required_field_error;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).firstname),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.lastName,
                      onChanged: (value) => driver.lastName = value,
                      validator: (value) {
                        if (value.isEmptyOrNull) {
                          return S.of(context).form_required_field_error;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).lastname),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.certificateNumber,
                      onChanged: (value) => driver.certificateNumber = value,
                      decoration: InputDecoration(
                          isDense: true,
                          labelText: S.of(context).certificate_number),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.email,
                      onChanged: (value) => driver.email = value,
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).email),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: driver.address,
                      onChanged: (value) {
                        driver.address = value;
                      },
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).address),
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
                      final input =
                          UpdateDriverInput(gender: driver.gender).toJson();
                      onLoadingStateUpdated(true);
                      await runMutation({
                        "input": {
                          "firstName": driver.firstName,
                          "lastName": driver.lastName,
                          "email": driver.email,
                          "certificateNumber": driver.certificateNumber,
                          "gender": input["gender"],
                          "address": driver.address
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
