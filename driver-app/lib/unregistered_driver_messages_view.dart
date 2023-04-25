import 'package:client_shared/theme/theme.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';
import 'graphql/generated/graphql_api.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UnregisteredDriverMessagesView extends StatelessWidget {
  final BasicProfileMixin? driver;
  final Refetch? refetch;

  const UnregisteredDriverMessagesView(
      {required this.driver, required this.refetch, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, packageInfo) => Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: CustomTheme.primaryColors.shade200,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(70))),
                child: SafeArea(
                  minimum: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "images/logo.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            packageInfo.data?.appName ?? "",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'images/registration-illustration.png',
                        width: 300,
                        height: 300,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              )),
          Flexible(
              child: Stack(
            children: [
              Positioned(
                left: -70,
                right: -70,
                top: 30,
                child: Image.asset(
                  'images/dotted-lines-1.png',
                ),
              ),
              if (driver == null)
                Center(
                  child: NotLoggedInUnregisteredView(refetch: refetch),
                ),
              if (driver?.status == DriverStatus.waitingDocuments)
                Center(
                  child: WaitingToCompleteSubmissionUnregisteredView(
                      refetch: refetch),
                ),
              if (driver?.status == DriverStatus.pendingApproval)
                Center(
                    child: RegistrationSubmittedUnregisteredView(
                        refetch: refetch)),
              if (driver?.status == DriverStatus.softReject)
                Center(
                  child: SoftRejectUnregisteredView(
                      rejectionNote: driver?.softRejectionNote),
                ),
              if (driver?.status == DriverStatus.hardReject)
                const Center(
                  child: HardRejectUnregisteredView(),
                )
            ],
          ))
        ],
      ),
    );
  }
}

class NotLoggedInUnregisteredView extends StatelessWidget {
  final Refetch? refetch;

  const NotLoggedInUnregisteredView({Key? key, required this.refetch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          S.of(context).onboarding_welcome,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(S.of(context).action_login_signup)),
        )
      ],
    );
  }
}

class WaitingToCompleteSubmissionUnregisteredView extends StatelessWidget {
  final Refetch? refetch;

  const WaitingToCompleteSubmissionUnregisteredView(
      {Key? key, required this.refetch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).onboarding_welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).incomplete_registration_description,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: CustomTheme.neutralColors.shade600),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(S.of(context).action_complete_registration)),
        )
      ],
    );
  }
}

class RegistrationSubmittedUnregisteredView extends StatelessWidget {
  final Refetch? refetch;

  const RegistrationSubmittedUnregisteredView({Key? key, required this.refetch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).onboarding_welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).pending_review_registration_description,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: CustomTheme.neutralColors.shade600),
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: OutlinedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, 'register');
              },
              child: Text(S.of(context).action_edit_submission)),
        )
      ],
    );
  }
}

class HardRejectUnregisteredView extends StatelessWidget {
  const HardRejectUnregisteredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).onboarding_welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Ionicons.close_circle,
                    color: Color(0xffb20d0e),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).hard_reject_registration,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: const Color(0xffb20d0e)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SoftRejectUnregisteredView extends StatelessWidget {
  final String? rejectionNote;
  const SoftRejectUnregisteredView({required this.rejectionNote, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: CustomTheme.neutralColors.shade200,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text(
                S.of(context).onboarding_welcome,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Ionicons.close_circle,
                    color: Color(0xffb20d0e),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    S.of(context).soft_rejection_description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: const Color(0xffb20d0e)),
                  ),
                ],
              ),
              if (!rejectionNote.isEmptyOrNull)
                Text(
                  rejectionNote ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: const Color(0xffb20d0e)),
                )
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: 300,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Text(
                S.of(context).action_edit_submission,
                style: const TextStyle(color: Color(0xffb20d0e)),
              )),
        )
      ],
    );
  }
}
