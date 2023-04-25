import 'package:client_shared/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:client_shared/components/user_avatar_view.dart';
import 'package:ridy/address/address_list_view.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:ridy/graphql/generated/graphql_api.graphql.dart';
import 'package:ridy/main/bloc/current_location_cubit.dart';
import 'package:ridy/main/bloc/jwt_cubit.dart';
import 'package:ridy/main/bloc/main_bloc.dart';
import 'package:ridy/main/bloc/rider_profile_cubit.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerLoggedIn extends StatelessWidget {
  final GetCurrentOrder$Query$Rider rider;

  const DrawerLoggedIn({required this.rider, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const SizedBox(
            height: 48,
          ),
          Row(
            children: [
              UserAvatarView(
                urlPrefix: serverUrl,
                url: rider.media?.address,
                cornerRadius: 10,
                size: 50,
                backgroundColor: CustomTheme.primaryColors.shade300,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  rider.firstName != null || rider.lastName != null
                      ? "${rider.firstName ?? " "} ${rider.lastName ?? " "}"
                      : "-",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.person),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_profile,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.notifications),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_announcements,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'announcements');
            },
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.wallet),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_wallet,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'wallet');
            },
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.compass),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_saved_locations,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<CurrentLocationCubit>(context),
                    child: const AddressListView(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.calendar),
            minLeadingWidth: 20.0,
            trailing:
                BlocBuilder<MainBloc, MainBlocState>(builder: (context, state) {
              if (state is! SelectingPoints || state.bookingsCount == 0) {
                return const SizedBox(
                  width: 5,
                  height: 5,
                );
              }
              return Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
                child: Text(
                  state.bookingsCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }),
            title: Text(
              S.of(context).menu_reserved_rides,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'reserves');
            },
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.time),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_trip_history,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () {
              Navigator.pushNamed(context, 'history');
            },
          ),
          if (!websiteUrl.isEmptyOrNull)
            ListTile(
              iconColor: CustomTheme.primaryColors.shade800,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: const Icon(Ionicons.globe),
              minLeadingWidth: 20.0,
              title: Text(
                S.of(context).menu_website,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                launchUrl(Uri.parse(websiteUrl!));
              },
            ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.information),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_about,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    'images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  applicationVersion:
                      "${packageInfo.version} (Build ${packageInfo.buildNumber})",
                  applicationName: packageInfo.appName,
                  applicationLegalese:
                      S.of(context).copyright_notice(companyName));
            },
          ),
          ListTile(
            iconColor: CustomTheme.primaryColors.shade800,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: const Icon(Ionicons.log_out),
            minLeadingWidth: 20.0,
            title: Text(
              S.of(context).menu_logout,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: () async {
              await Hive.box('user').delete('jwt');
              Future.delayed(const Duration(milliseconds: 200), () {
                context.read<JWTCubit>().logOut();
              });
              Future.delayed(const Duration(milliseconds: 500), () {
                context.read<RiderProfileCubit>().updateProfile(null);
              });

              //exit(1);
            },
          )
        ]),
      ),
    );
  }
}
