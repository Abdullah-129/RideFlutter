import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'onboarding_get_rewards_view.dart';
import 'onboarding_language_view.dart';
import 'onboarding_sign_in.dart';
import 'onboarding_welcome_view.dart';

class OnBoardingView extends StatelessWidget {
  final PageController pageController = PageController();

  OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, packageInfo) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return OnboardingWelcome(
                                    onNextClicked: () => nextPage());

                              case 1:
                                return OnboardingGetRewards(
                                    onNextClicked: () => nextPage());

                              case 2:
                                return OnboardingLanguage(
                                    onNextClicked: () => nextPage());

                              case 3:
                                return OnboardingSignIn(
                                    onNextClicked: () => nextPage());
                            }
                            return OnboardingWelcome(
                              onNextClicked: () => nextPage(),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }
}
