import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class RegisterVerificationCodeView extends StatefulWidget {
  final String verificationCodeId;
  final String phoneNumber;
  final Function() onLoggedIn;
  final Function(bool loading) onLoadingStateUpdated;

  const RegisterVerificationCodeView(
      {Key? key,
      required this.verificationCodeId,
      required this.phoneNumber,
      required this.onLoggedIn,
      required this.onLoadingStateUpdated})
      : super(key: key);

  @override
  State<RegisterVerificationCodeView> createState() =>
      _RegisterVerificationCodeViewState();
}

class _RegisterVerificationCodeViewState
    extends State<RegisterVerificationCodeView> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).register_verify_code_title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).register_verify_code_subtitle(widget.phoneNumber),
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 24),
        Mutation(
            options: MutationOptions(document: LOGIN_MUTATION_DOCUMENT),
            builder: (RunMutation runMutation, QueryResult? result) {
              return Pinput(
                focusNode: focusNode,
                length: 6,
                onCompleted: (value) async {
                  widget.onLoadingStateUpdated(true);
                  final PhoneAuthCredential credential =
                      PhoneAuthProvider.credential(
                          verificationId: widget.verificationCodeId,
                          smsCode: value);
                  final UserCredential cr = await FirebaseAuth.instance
                      .signInWithCredential(credential);
                  final String firebaseToken = await cr.user!.getIdToken();
                  final args =
                      LoginArguments(firebaseToken: firebaseToken).toJson();
                  final netResult = await runMutation(args).networkResult;
                  final loginRes = Login$Mutation.fromJson(netResult!.data!);
                  final jwt = loginRes.login.jwtToken;
                  Hive.box('user').put('jwt', jwt);
                  widget.onLoadingStateUpdated(false);
                  widget.onLoggedIn();
                },
              );
            }),
        const Spacer(),
      ],
    );
  }
}
