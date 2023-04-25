import 'package:client_shared/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';
import 'package:ridy/main/bloc/jwt_cubit.dart';
import '../login/login_number_view.dart';
import 'package:client_shared/theme/theme.dart';

class DrawerLoggedOut extends StatelessWidget {
  const DrawerLoggedOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(children: [
        const SizedBox(height: 64),
        ListTile(
          iconColor: CustomTheme.primaryColors.shade800,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: const Icon(Ionicons.log_in),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_login,
              style: Theme.of(context).textTheme.titleMedium),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                constraints: const BoxConstraints(maxWidth: 600),
                builder: (context) {
                  return BlocProvider.value(
                    value: context.read<JWTCubit>(),
                    child: const LoginNumberView(),
                  );
                });
          },
        ),
        ListTile(
          iconColor: CustomTheme.primaryColors.shade800,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: const Icon(Ionicons.information),
          minLeadingWidth: 20.0,
          title: Text(S.of(context).menu_about,
              style: Theme.of(context).textTheme.titleMedium),
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
        )
      ]),
    );
  }
}
