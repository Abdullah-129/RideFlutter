import 'dart:io';

import 'package:client_shared/theme/theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

class OnboardingLanguage extends StatefulWidget {
  final Function() onNextClicked;
  static const Map<String, String> languages = {
    "en": "English",
    "es": "español",
    "fr": "Français",
    "de": "Deutsch",
    "pt": "Português",
    "it": "Italiano",
    "sv": "Svenska",
    "hi": "हिन्दी",
    "id": "bahasa Indonesia",
    "hy": "հայերեն",
    "zh": "中文",
    "ar": "عربى",
    "ja": "日本",
    "ko": "한국어",
    "fa": "فارسی",
    "ur": "اردو",
    "bn": "বাংলা",
    "am": "Amharic"
  };

  const OnboardingLanguage({Key? key, required this.onNextClicked})
      : super(key: key);

  @override
  State<OnboardingLanguage> createState() => _OnboardingLanguageState();
}

class _OnboardingLanguageState extends State<OnboardingLanguage> {
  String selectedLanguageCode = "en";

  @override
  void initState() {
    String locale = Platform.localeName.split('_')[0];
    Hive.openBox("settings").then((value) {
      final languageCode = value.get("language", defaultValue: null);
      if (languageCode == null) {
        if (OnboardingLanguage.languages.containsKey(locale)) {
          OnboardingLanguage.languages.keys
              .firstWhere((element) => element == locale);
        }
      } else {
        setState(() {
          selectedLanguageCode = OnboardingLanguage.languages.keys
                  .cast<String?>()
                  .firstWhere((element) => element == languageCode,
                      orElse: () => null) ??
              "en";
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  child: Container(
                    height: 370,
                    decoration: BoxDecoration(
                        color: CustomTheme.primaryColors.shade100,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(70),
                            bottomRight: Radius.circular(70))),
                  ),
                ),
                const SizedBox(width: 50),
                Flexible(
                  flex: 5,
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
                      "images/onboarding-3.png",
                    ),
                  ),
                  const SizedBox(height: 24),
                  DotsIndicator(
                    dotsCount: 4,
                    position: 2,
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
        const SizedBox(height: 16),
        Text(
          S.of(context).onboarding_select_language_title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: SizedBox(
            height: 130,
            width: 200,
            child: ValueListenableBuilder<Box>(
                valueListenable:
                    Hive.box('settings').listenable(keys: ['language']),
                builder: (context, box, widget) {
                  if (box.get('language') != null) {
                    selectedLanguageCode = box.get('language');
                  }
                  return ListView.builder(
                      itemCount: OnboardingLanguage.languages.length,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: OnboardingLanguage.languages.keys
                                              .elementAt(index) ==
                                          selectedLanguageCode
                                      ? CustomTheme.primaryColors.shade400
                                      : CustomTheme.neutralColors.shade200,
                                  width: 1.5),
                              color: CustomTheme.neutralColors.shade200,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(children: [
                            Radio<String>(
                                visualDensity: VisualDensity.compact,
                                value: OnboardingLanguage.languages.keys
                                    .elementAt(index),
                                groupValue: selectedLanguageCode,
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null) {
                                      selectedLanguageCode = value;
                                    }
                                  });
                                  Hive.box('settings').put('language', value);
                                }),
                            Text(
                                OnboardingLanguage.languages.values
                                    .elementAt(index),
                                style: Theme.of(context).textTheme.titleMedium)
                          ]),
                        );
                      });
                }),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
            onPressed: () {
              widget.onNextClicked();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Text(S.of(context).action_next),
            ))
      ],
    );
  }
}
