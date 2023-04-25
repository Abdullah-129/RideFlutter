import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:client_shared/theme/theme.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';
import '../graphql/generated/graphql_api.graphql.dart';

class RidePreferencesSheetView extends StatefulWidget {
  final GetFare$Query$CalculateFareDTO$ServiceCategory$Service service;
  final List<String> defaultSelectedOptions;

  const RidePreferencesSheetView(this.service, this.defaultSelectedOptions,
      {Key? key})
      : super(key: key);

  @override
  State<RidePreferencesSheetView> createState() =>
      _RidePreferencesSheetViewState();
}

class _RidePreferencesSheetViewState extends State<RidePreferencesSheetView> {
  late List<String> selectedOptions = widget.defaultSelectedOptions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
                title: S.of(context).ride_preferences_title,
                closeAction: () => Navigator.pop(context)),
            ...widget.service.options.map((e) => RidePreferenceItem(
                option: e,
                isSelected: selectedOptions.contains(e.id),
                onSelectionChanged: (selected) {
                  setState(() {
                    if (selected) {
                      selectedOptions.add(e.id);
                    } else {
                      selectedOptions.remove(e.id);
                    }
                  });
                })),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    if (listEquals(
                        selectedOptions, widget.defaultSelectedOptions)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context, selectedOptions);
                    }
                  },
                  child: Text(S.of(context).action_confirm_and_continue),
                ))
              ],
            )
          ],
        ));
  }
}

class RidePreferenceItem extends StatelessWidget {
  final GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
      option;
  final bool isSelected;
  final Function(bool) onSelectionChanged;

  const RidePreferenceItem(
      {required this.option,
      required this.isSelected,
      required this.onSelectionChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => onSelectionChanged(!isSelected),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: isSelected
                        ? CustomTheme.primaryColors
                        : Colors.transparent,
                  ),
                  color: isSelected
                      ? CustomTheme.primaryColors.shade200
                      : CustomTheme.neutralColors.shade200),
              child: Icon(
                getOptionIcon(),
                size: 32,
                color: isSelected
                    ? CustomTheme.primaryColors
                    : CustomTheme.neutralColors.shade400,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              option.name,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }

  IconData getOptionIcon() {
    switch (option.icon) {
      case ServiceOptionIcon.pet:
        return Ionicons.paw;

      case ServiceOptionIcon.twoWay:
        return Ionicons.repeat;

      case ServiceOptionIcon.luggage:
        return Ionicons.briefcase;

      case ServiceOptionIcon.packageDelivery:
        return Ionicons.cube;

      case ServiceOptionIcon.shopping:
        return Ionicons.cart;

      case ServiceOptionIcon.custom1:
        return Ionicons.help;

      case ServiceOptionIcon.custom2:
        return Ionicons.help;

      case ServiceOptionIcon.custom3:
        return Ionicons.help;

      case ServiceOptionIcon.custom4:
        return Ionicons.help;

      case ServiceOptionIcon.custom5:
        return Ionicons.help;

      case ServiceOptionIcon.artemisUnknown:
        return Ionicons.help;
    }
  }
}
