import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:ridy/register/pages/register_contact_details_view.dart';
import 'package:ridy/register/pages/register_payout_details_view.dart';
import 'package:ridy/register/pages/register_phone_number_view.dart';
import 'package:ridy/register/pages/register_ride_details_view.dart';
import 'package:ridy/register/pages/register_upload_documents_view.dart';
import 'package:ridy/register/pages/register_verification_code_view.dart';

import '../query_result_view.dart';

class RegisterView extends StatefulWidget {
  static const allowedStatuses = [
    DriverStatus.waitingDocuments,
    DriverStatus.pendingApproval,
    DriverStatus.softReject
  ];
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  int activePageId = 0;
  PageController pageController = PageController(initialPage: 0);
  String? verificationId;
  String? phoneNumber;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      const RidyBackButton(text: ""),
                      Center(child: Text(S.of(context).driver_register_title))
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RegistrationStepOrb(
                                  id: 0, activePageId: activePageId),
                              RegistrationStepDottedLine(
                                  id: 0, activePageId: activePageId),
                              RegistrationStepOrb(
                                  id: 1, activePageId: activePageId),
                              RegistrationStepDottedLine(
                                  id: 1, activePageId: activePageId),
                              RegistrationStepOrb(
                                  id: 2, activePageId: activePageId),
                              RegistrationStepDottedLine(
                                  id: 2, activePageId: activePageId),
                              RegistrationStepOrb(
                                  id: 3, activePageId: activePageId),
                              RegistrationStepDottedLine(
                                  id: 3, activePageId: activePageId),
                              RegistrationStepOrb(
                                  id: 4, activePageId: activePageId),
                              RegistrationStepDottedLine(
                                  id: 4, activePageId: activePageId),
                              RegistrationStepOrb(
                                  id: 5, activePageId: activePageId)
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RegistrationStepTitle(
                                id: 0,
                                title: S.of(context).register_step_phone_number,
                                activePageId: activePageId),
                            RegistrationStepTitle(
                                id: 1,
                                title:
                                    S.of(context).register_step_verify_number,
                                activePageId: activePageId),
                            RegistrationStepTitle(
                                id: 2,
                                title:
                                    S.of(context).register_step_contact_details,
                                activePageId: activePageId),
                            RegistrationStepTitle(
                                id: 3,
                                title: S.of(context).register_step_ride_details,
                                activePageId: activePageId),
                            RegistrationStepTitle(
                                id: 4,
                                title:
                                    S.of(context).register_step_payout_details,
                                activePageId: activePageId),
                            RegistrationStepTitle(
                                id: 5,
                                title: S
                                    .of(context)
                                    .register_step_upload_documents,
                                activePageId: activePageId),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Query(
                      options: QueryOptions(
                          document: GET_DRIVER_QUERY_DOCUMENT,
                          fetchPolicy: FetchPolicy.networkOnly),
                      builder: (QueryResult result,
                          {Refetch? refetch, FetchMore? fetchMore}) {
                        GetDriver$Query$Driver? driver;
                        if (result.isLoading) {
                          return Expanded(child: QueryResultView(result));
                        }
                        List<GetDriver$Query$CarModel> models = [];
                        List<GetDriver$Query$CarColor> colors = [];
                        GetDriver$Query query = GetDriver$Query();
                        if (result.data != null) {
                          query = GetDriver$Query.fromJson(result.data!);
                          models = query.carModels;
                          colors = query.carColors;
                          if (query.driver?.mobileNumber != null) {
                            if (!RegisterView.allowedStatuses
                                .contains(query.driver?.status)) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.pop(context);
                              });
                              return Container();
                            }
                          }
                          driver = query.driver;
                          models = query.carModels;
                          colors = query.carColors;
                          if (driver != null && activePageId < 2) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              pageController.jumpToPage(2);
                              setState(() {
                                activePageId = 2;
                              });
                            });
                          }
                          if (pageController.initialPage != activePageId) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              pageController.jumpToPage(activePageId);
                            });
                          }
                        }
                        return Expanded(
                          child: PageView.builder(
                              controller: pageController,
                              itemCount: 6,
                              physics: const NeverScrollableScrollPhysics(),
                              onPageChanged: (value) =>
                                  setState(() => activePageId = value),
                              itemBuilder: ((context, index) {
                                switch (index) {
                                  case 0:
                                    return RegisterPhoneNumberView(
                                      driver: driver,
                                      onCodeSent:
                                          (verificationId, phoneNumber) {
                                        this.verificationId = verificationId;
                                        this.phoneNumber = phoneNumber;
                                        pageController.jumpToPage(1);
                                      },
                                      onLoggedIn: () {
                                        pageController.jumpToPage(2);
                                        refetch!();
                                      },
                                      onLoadingStateUpdated: (loading) =>
                                          setState(() => isLoading = loading),
                                    );

                                  case 1:
                                    return RegisterVerificationCodeView(
                                      verificationCodeId: verificationId!,
                                      phoneNumber: phoneNumber!,
                                      onLoggedIn: () {
                                        pageController.jumpToPage(2);
                                        refetch!();
                                      },
                                      onLoadingStateUpdated: (loading) =>
                                          setState(() => isLoading = loading),
                                    );

                                  case 2:
                                    return RegisterContactDetailsView(
                                      driver: driver!,
                                      onContinue: () =>
                                          pageController.jumpToPage(3),
                                      onLoadingStateUpdated: (loading) =>
                                          setState(() => isLoading = loading),
                                    );

                                  case 3:
                                    return RegisterRideDetailsView(
                                      driver: driver!,
                                      models: models,
                                      colors: colors,
                                      onContinue: () =>
                                          pageController.jumpToPage(4),
                                      onLoadingStateUpdated: (loading) =>
                                          setState(() => isLoading = loading),
                                    );

                                  case 4:
                                    return RegisterPayoutDetailsView(
                                      driver: driver!,
                                      onContinue: () =>
                                          pageController.jumpToPage(5),
                                      onLoadingStateUpdated: (loading) =>
                                          setState(() => isLoading = loading),
                                    );

                                  case 5:
                                    return RegisterUploadDocumentsView(
                                      driver: driver!,
                                      onUploaded: () => refetch!(),
                                      onLoadingStateUpdated: (loading) =>
                                          setState(() => isLoading = loading),
                                    );

                                  default:
                                    return const Text("Unsupported state");
                                }
                              })),
                        );
                      })
                ],
              ),
              if (isLoading)
                Positioned.fill(
                    child: Container(
                  color: Colors.white60,
                  child: const QueryResultLoadingView(),
                ))
            ],
          )),
    );
  }
}

class RegistrationStepOrb extends StatelessWidget {
  final int activePageId;
  final int id;

  const RegistrationStepOrb(
      {Key? key, required this.activePageId, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27,
      child: Column(
        children: [
          Row(
            children: [
              AnimatedContainer(
                width: 27,
                height: 27,
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: activePageId >= id
                        ? CustomTheme.primaryColors
                        : CustomTheme.neutralColors.shade200),
                child: Center(
                  child: Text("${id + 1}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: activePageId >= id
                              ? CustomTheme.primaryColors.shade50
                              : CustomTheme.neutralColors.shade800)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6)
        ],
      ),
    );
  }
}

class RegistrationStepTitle extends StatelessWidget {
  final int activePageId;
  final int id;
  final String title;

  const RegistrationStepTitle(
      {Key? key,
      required this.activePageId,
      required this.id,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: activePageId == id,
        child: Center(
            child: Text(title, style: Theme.of(context).textTheme.labelSmall)));
  }
}

class RegistrationStepDottedLine extends StatelessWidget {
  final int activePageId;
  final int id;
  const RegistrationStepDottedLine(
      {Key? key, required this.activePageId, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 13),
      child: DottedLine(
          dashColor: (id >= activePageId
              ? CustomTheme.neutralColors.shade200
              : CustomTheme.primaryColors)),
    ));
  }
}
