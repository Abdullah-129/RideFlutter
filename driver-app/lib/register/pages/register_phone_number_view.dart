import 'package:client_shared/config.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

import 'package:ridy/graphql/generated/graphql_api.graphql.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPhoneNumberView extends StatefulWidget {
  final GetDriver$Query$Driver? driver;
  final Function(String verificationId, String phoneNumber) onCodeSent;
  final Function() onLoggedIn;
  final Function(bool loading) onLoadingStateUpdated;

  const RegisterPhoneNumberView(
      {Key? key,
      this.driver,
      required this.onCodeSent,
      required this.onLoggedIn,
      required this.onLoadingStateUpdated})
      : super(key: key);

  @override
  State<RegisterPhoneNumberView> createState() =>
      _RegisterPhoneNumberViewState();
}

class _RegisterPhoneNumberViewState extends State<RegisterPhoneNumberView> {
  bool agreedToTerms = false;
  String countryCode = defaultCountryCode;
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).register_number_title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).register_number_subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 24),
        Row(children: [
          Container(
            decoration: BoxDecoration(
                color: CustomTheme.neutralColors.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: CountryCodePicker(
              boxDecoration: BoxDecoration(
                  color: CustomTheme.neutralColors.shade100,
                  borderRadius: BorderRadius.circular(10)),
              initialSelection: countryCode,
              onChanged: (value) => countryCode = value.dialCode ?? countryCode,
            ),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: TextFormField(
              initialValue: phoneNumber,
              onChanged: (value) => phoneNumber = value,
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                isDense: true,
                labelText: S.of(context).cell_number,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).phone_number_empty;
                } else {
                  return null;
                }
              },
            ),
          ),
        ]),
        if (loginTermsAndConditionsUrl.isNotEmpty)
          RegistrationPhoneNumberTermsCheckbox(
            agreedToTerms: agreedToTerms,
            onAgreedChanged: (value) => setState(() => agreedToTerms = value),
          ),
        const Spacer(),
        SizedBox(
            width: double.infinity,
            child: Mutation(
              options: MutationOptions(document: LOGIN_MUTATION_DOCUMENT),
              builder: (RunMutation runMutation, QueryResult? result) =>
                  ElevatedButton(
                      onPressed: () async {
                        if (loginTermsAndConditionsUrl.isNotEmpty &&
                            !agreedToTerms) {
                          return;
                        }
                        if (phoneNumber.isEmpty) {
                          return;
                        }
                        widget.onLoadingStateUpdated(true);
                        if (kIsWeb) {
                          final authResult = await FirebaseAuth.instance
                              .signInWithPhoneNumber(phoneNumber);
                          widget.onCodeSent(authResult.verificationId,
                              countryCode + phoneNumber);
                        } else {
                          FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: countryCode + phoneNumber,
                              verificationCompleted: (PhoneAuthCredential
                                  phoneAuthCredential) async {
                                final UserCredential cr = await FirebaseAuth
                                    .instance
                                    .signInWithCredential(phoneAuthCredential);
                                final String firebaseToken =
                                    await cr.user!.getIdToken();
                                final args =
                                    LoginArguments(firebaseToken: firebaseToken)
                                        .toJson();
                                final netResult =
                                    await runMutation(args).networkResult;
                                final loginRes =
                                    Login$Mutation.fromJson(netResult!.data!);
                                final jwt = loginRes.login.jwtToken;
                                Hive.box('user').put('jwt', jwt);
                                widget.onLoadingStateUpdated(false);
                                widget.onLoggedIn();
                              },
                              verificationFailed:
                                  (FirebaseAuthException error) {
                                widget.onLoadingStateUpdated(false);
                                final snackBar = SnackBar(
                                    content: Text(error.message ??
                                        S.of(context).message_unknown_error));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              codeSent: (String verificationId,
                                  int? forceResendingToken) {
                                widget.onLoadingStateUpdated(false);
                                widget.onCodeSent(
                                    verificationId, countryCode + phoneNumber);
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {});
                        }
                      },
                      child: Text(S.of(context).action_continue)),
            ))
      ],
    );
  }
}

class RegistrationPhoneNumberTermsCheckbox extends StatelessWidget {
  final bool agreedToTerms;
  final Function(bool value) onAgreedChanged;

  const RegistrationPhoneNumberTermsCheckbox(
      {Key? key, required this.agreedToTerms, required this.onAgreedChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: agreedToTerms,
            onChanged: (value) => onAgreedChanged(value ?? false)),
        Flexible(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                style: const TextStyle(color: Colors.black),
                text: S.of(context).terms_and_condition_first_part),
            TextSpan(
                style: const TextStyle(color: Colors.blue),
                text: S.of(context).terms_and_conditions_clickable_part,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    launchUrl(Uri.parse(loginTermsAndConditionsUrl));
                  })
          ])),
        ),
      ],
    );
  }
}
