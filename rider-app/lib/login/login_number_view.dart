import 'package:client_shared/config.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../login/login_verification_code_view.dart';
import '../main/bloc/jwt_cubit.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class LoginNumberView extends StatefulWidget {
  const LoginNumberView({Key? key}) : super(key: key);

  @override
  State<LoginNumberView> createState() => _LoginNumberViewState();
}

class _LoginNumberViewState extends State<LoginNumberView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String phoneNumber = "";
  String countryCode = !kIsWeb
      ? (CountryCodes.detailsForLocale().dialCode ?? defaultCountryCode)
      : defaultCountryCode;
  bool agreedToTerms = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SheetTitleView(
              title: S.of(context).login_title,
              closeAction: () => Navigator.pop(context),
            ),
            Text(
              S.of(context).login_body,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: CustomTheme.neutralColors.shade200,
                      borderRadius: BorderRadius.circular(10)),
                  child: CountryCodePicker(
                    boxDecoration: BoxDecoration(
                        color: CustomTheme.neutralColors.shade100,
                        borderRadius: BorderRadius.circular(10)),
                    initialSelection: countryCode,
                    onChanged: (code) => countryCode = code.dialCode!,
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: S.of(context).login_cell_number_textfield_hint,
                    ),
                    onChanged: (value) => phoneNumber = value,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).login_cell_number_empty_error;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            if (loginTermsAndConditionsUrl.isNotEmpty)
              Row(
                children: [
                  Checkbox(
                      value: agreedToTerms,
                      onChanged: (value) =>
                          setState(() => agreedToTerms = value ?? false)),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(color: Colors.black),
                        text: S.of(context).terms_and_condition_text),
                    TextSpan(
                        style: const TextStyle(color: Colors.blue),
                        text: S.of(context).terms_and_condition_button,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(Uri.parse(loginTermsAndConditionsUrl));
                          })
                  ])),
                ],
              ).pOnly(top: 8),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Mutation(
                  options: MutationOptions(document: LOGIN_MUTATION_DOCUMENT),
                  builder: (RunMutation runMutation, QueryResult? result) {
                    return ElevatedButton(
                        onPressed: (!agreedToTerms &&
                                    loginTermsAndConditionsUrl.isNotEmpty ||
                                (result?.isLoading ?? false))
                            ? null
                            : () async {
                                if (!kIsWeb) {
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber: countryCode + phoneNumber,
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) async {
                                      final UserCredential cr =
                                          await FirebaseAuth.instance
                                              .signInWithCredential(credential);
                                      final String firebaseToken =
                                          await cr.user!.getIdToken();
                                      final QueryResult qe = await runMutation(
                                              {"firebaseToken": firebaseToken})
                                          .networkResult!;
                                      final String jwt =
                                          Login$Mutation.fromJson(qe.data!)
                                              .login
                                              .jwtToken;

                                      final Box box =
                                          await Hive.openBox('user');
                                      box.put("jwt", jwt);
                                      if (!mounted) return;
                                      Navigator.pop(context);
                                      context.read<JWTCubit>().login(jwt);
                                    },
                                    verificationFailed:
                                        (FirebaseAuthException e) async {
                                      if (e.message != null) {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  content: Text(e.message!),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(S
                                                            .of(context)
                                                            .action_ok))
                                                  ],
                                                ));
                                      }

                                      await FirebaseCrashlytics.instance
                                          .recordError(e, e.stackTrace,
                                              reason: 'Login error');
                                    },
                                    codeSent: (String verificationId,
                                        int? resendToken) async {
                                      await showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        constraints:
                                            const BoxConstraints(maxWidth: 600),
                                        builder: (context) {
                                          return LoginVerificationCodeView(
                                              verificationId: verificationId);
                                        },
                                      );
                                      Navigator.pop(context);
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );
                                } else {
                                  //Navigator.pop(context);
                                  final result = await FirebaseAuth.instance
                                      .signInWithPhoneNumber(
                                          countryCode + phoneNumber);
                                  if (!mounted) return;
                                  await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    constraints:
                                        const BoxConstraints(maxWidth: 600),
                                    builder: (context) {
                                      return LoginVerificationCodeView(
                                          verificationId:
                                              result.verificationId);
                                    },
                                  );
                                  Navigator.pop(context);
                                }
                              },
                        child: Text(S.of(context).action_continue));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
