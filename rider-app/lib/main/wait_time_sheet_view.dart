import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_shared/components/sheet_title_view.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

// ignore: must_be_immutable
class WaitTimeSheetView extends StatelessWidget {
  final items = [0, 3, 5, 10, 15, 20, 30, 40, 60];
  int selectedMinute;

  WaitTimeSheetView({required this.selectedMinute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
              title: S.of(context).title_wait_time,
              closeAction: () => Navigator.pop(context),
            ),
            SizedBox(
              height: 150,
              child: CupertinoPicker.builder(
                  itemExtent: 45,
                  childCount: items.length,
                  scrollController: FixedExtentScrollController(
                      initialItem: items
                          .indexWhere((element) => element == selectedMinute)),
                  onSelectedItemChanged: (index) {
                    selectedMinute = items[index];
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).minutes_format(index == 0
                              ? items[index]
                              : "${items[index - 1]}-${items[index]}"),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, selectedMinute);
                    },
                    child: Text(S.of(context).action_confirm)))
          ],
        ));
  }
}
