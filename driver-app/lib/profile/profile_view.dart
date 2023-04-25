import 'package:client_shared/components/back_button.dart';
import 'package:client_shared/components/list_shimmer_skeleton.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ridy/config.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:ridy/graphql/generated/graphql_api.dart';
import 'package:ridy/profile/profile_info_card.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<bool> _isOpen = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RidyBackButton(text: S.of(context).action_back),
              const SizedBox(height: 4),
              Text(S.of(context).menu_profile,
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 12),
              Query(
                  options: QueryOptions(document: GET_PROFILE_QUERY_DOCUMENT),
                  builder: (result, {fetchMore, refetch}) {
                    if (result.isLoading) {
                      return Shimmer.fromColors(
                        baseColor: CustomTheme.neutralColors.shade300,
                        highlightColor: CustomTheme.neutralColors.shade100,
                        enabled: true,
                        child: const ListShimmerSkeleton(),
                      );
                    }
                    final driver =
                        GetProfile$Query.fromJson(result.data!).driver!;
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Center(
                            child: UserAvatarView(
                                urlPrefix: serverUrl,
                                url: driver.media?.address,
                                cornerRadius: 12,
                                size: 82),
                          ),
                          const SizedBox(height: 4),
                          Text("${driver.firstName} ${driver.lastName}",
                              style: Theme.of(context).textTheme.headlineLarge),
                          Text(
                            "+${driver.mobileNumber}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            ProfileInfoCard(
                                title: S.of(context).profile_distance_traveled,
                                subtitle: Text(
                                  driver.historyOrdersAggregate.first.sum
                                              ?.distanceBest ==
                                          null
                                      ? "0"
                                      : driver.historyOrdersAggregate.first.sum!
                                          .distanceBest
                                          .toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            ProfileInfoCard(
                                title: S.of(context).profile_total_trips,
                                subtitle: Text(
                                  driver.historyOrdersAggregate.first.count?.id
                                          .toString() ??
                                      "0",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                            ProfileInfoCard(
                                title: S.of(context).profile_rating,
                                subtitle: Row(children: [
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Ionicons.star,
                                    color: Color(0xFFEFC868),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    driver.rating?.toString() ?? "-",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(width: 12)
                                ]))
                          ]),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            decoration: BoxDecoration(
                                color: CustomTheme.primaryColors.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Text(
                                  S.of(context).profile_services_title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                    child: SingleChildScrollView(
                                  child: Row(
                                      children: driver.enabledServices
                                          .map((e) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                child: Text(
                                                  "•  ${e.name}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                              ))
                                          .toList()),
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                color: CustomTheme.primaryColors.shade100,
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionPanelList(
                                elevation: 0,
                                children: [
                                  ExpansionPanel(
                                      backgroundColor: Colors.transparent,
                                      isExpanded: _isOpen[0],
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) {
                                        return Container(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            S
                                                .of(context)
                                                .profile_bank_information_title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        );
                                      },
                                      body: BankInformationTableView(
                                        driver: driver,
                                      ))
                                ],
                                expansionCallback: (panelIndex, isExpanded) {
                                  setState(() {
                                    _isOpen[0] = !isExpanded;
                                  });
                                }),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                color: CustomTheme.primaryColors.shade100,
                                borderRadius: BorderRadius.circular(12)),
                            child: ExpansionPanelList(
                                elevation: 0,
                                children: [
                                  ExpansionPanel(
                                      backgroundColor: Colors.transparent,
                                      isExpanded: _isOpen[1],
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) {
                                        return Container(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            S
                                                .of(context)
                                                .profile_vehicle_information_title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        );
                                      },
                                      body: VehicleInformationTableView(
                                          driver: driver))
                                ],
                                expansionCallback: (panelIndex, isExpanded) {
                                  setState(() {
                                    _isOpen[1] = !isExpanded;
                                  });
                                }),
                          ),
                          if (driver.documents.isNotEmpty)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 4, top: 12),
                                child: Text(
                                    S
                                        .of(context)
                                        .profile_uploaded_documents_title,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ),
                            ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: driver.documents
                                        .map(
                                          (e) => Container(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                serverUrl + e.address,
                                                width: 105,
                                                height: 105,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 50),
                        ]),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
}

class BankInformationTableView extends StatelessWidget {
  final GetProfile$Query$Driver driver;
  const BankInformationTableView({Key? key, required this.driver})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ProfileInformationRow(
              title: S.of(context).account_number,
              content: driver.accountNumber ?? "-"),
          const Divider(),
          ProfileInformationRow(
              title: S.of(context).bank_name, content: driver.bankName ?? "-"),
          const Divider(),
          ProfileInformationRow(
              title: S.of(context).address, content: driver.address ?? "-"),
        ],
      ),
    );
  }
}

class VehicleInformationTableView extends StatelessWidget {
  final GetProfile$Query$Driver driver;
  const VehicleInformationTableView({Key? key, required this.driver})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ProfileInformationRow(
              title: S.of(context).car_model, content: driver.car?.name ?? "-"),
          const Divider(),
          ProfileInformationRow(
              title: S.of(context).car_color,
              content: driver.carColor?.name ?? "-"),
          const Divider(),
          ProfileInformationRow(
              title: S.of(context).plate_number,
              content: driver.carPlate ?? "-"),
        ],
      ),
    );
  }
}

class ProfileInformationRow extends StatelessWidget {
  final String title;
  final String content;

  const ProfileInformationRow(
      {required this.title, required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: CustomTheme.neutralColors.shade700),
        ),
        const Spacer(),
        Expanded(
            child: Text(
          content,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.labelMedium,
        ))
      ],
    );
  }
}
