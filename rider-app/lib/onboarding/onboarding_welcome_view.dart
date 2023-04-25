import 'package:client_shared/config.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class OnboardingWelcome extends StatelessWidget {
  final Function() onNextClicked;

  const OnboardingWelcome({Key? key, required this.onNextClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                const SizedBox(width: 20),
                Flexible(
                  child: Container(
                    height: 370,
                    decoration: BoxDecoration(
                        color: CustomTheme.primaryColors.shade100,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(70),
                            bottomLeft: Radius.circular(70))),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 400, maxHeight: 400),
                    child: Image.asset(
                      "images/onboarding-1.png",
                    ),
                  ),
                  const SizedBox(height: 24),
                  DotsIndicator(
                    dotsCount: 4,
                    position: 0,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 9.0),
                      color: CustomTheme.neutralColors.shade300,
                      activeColor: CustomTheme.primaryColors,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          S.of(context).onboarding_first_page_title(appName),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            S.of(context).onboarding_first_page_body,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
            onPressed: () {
              onNextClicked();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Text(S.of(context).action_next),
            ))
      ],
    );
  }
}
