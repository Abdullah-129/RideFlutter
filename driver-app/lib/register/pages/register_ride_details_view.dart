import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import '../../graphql/generated/graphql_api.graphql.dart';

class RegisterRideDetailsView extends StatelessWidget {
  final Function() onContinue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GetDriver$Query$Driver driver;
  final List<GetDriver$Query$CarModel> models;
  final List<GetDriver$Query$CarColor> colors;
  final Function(bool loading) onLoadingStateUpdated;

  RegisterRideDetailsView(
      {Key? key,
      required this.driver,
      required this.models,
      required this.colors,
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
                      S.of(context).register_ride_details_title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            initialValue: driver.carPlate,
                            onChanged: (value) => driver.carPlate = value,
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: S.of(context).plate_number),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue:
                                driver.carProductionYear?.toString() ?? "",
                            onChanged: (value) {
                              driver.carProductionYear = int.tryParse(value);
                            },
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                isDense: true,
                                labelText: S.of(context).car_production_year),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: driver.carId,
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).car_model),
                      items: models
                          .map((e) => DropdownMenuItem(
                              value: e.id, child: Text(e.name)))
                          .toList(),
                      onChanged: (String? id) => driver.carId = id,
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: driver.carId,
                      decoration: InputDecoration(
                          isDense: true, labelText: S.of(context).car_color),
                      items: colors
                          .map((e) => DropdownMenuItem(
                              value: e.id, child: Text(e.name)))
                          .toList(),
                      onChanged: (String? id) => driver.carColorId = id,
                    )
                  ]),
            ),
          ),
          Mutation(
              options:
                  MutationOptions(document: UPDATE_PROFILE_MUTATION_DOCUMENT),
              builder: (RunMutation runMutation, QueryResult? result) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? isValid = _formKey.currentState?.validate();
                      if (isValid != true) return;
                      onLoadingStateUpdated(true);
                      final result = await runMutation({
                        "input": {
                          "carProductionYear": driver.carProductionYear,
                          "carPlate": driver.carPlate,
                          "carColorId": driver.carColorId,
                          "carId": driver.carId
                        }
                      }).networkResult;
                      onLoadingStateUpdated(false);
                      if (result?.hasException ?? false) {
                        final snackBar = SnackBar(
                            content: Text(result?.exception?.graphqlErrors
                                    .map((e) => e.message)
                                    .join(',') ??
                                // ignore: use_build_context_synchronously
                                S.of(context).message_unknown_error));
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        onContinue();
                      }
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
