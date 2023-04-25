import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_shared/components/sheet_title_view.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class ReserveRideSheetView extends StatefulWidget {
  const ReserveRideSheetView({Key? key}) : super(key: key);

  @override
  State<ReserveRideSheetView> createState() => _ReserveRideSheetViewState();
}

class _ReserveRideSheetViewState extends State<ReserveRideSheetView> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        SheetTitleView(
          title: S.of(context).title_reserve_ride,
          closeAction: () => Navigator.pop(context),
        ),
        const SizedBox(height: 8),
        SizedBox(
            height: 250,
            child: CupertinoDatePicker(
                initialDateTime:
                    DateTime.now().add(const Duration(minutes: 40)),
                minimumDate: DateTime.now().add(const Duration(minutes: 30)),
                onDateTimeChanged: ((value) => setState(() {
                      dateTime = value;
                    })))),
        const Divider(),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: dateTime == null
                        ? null
                        : () {
                            Navigator.pop(context, dateTime);
                          },
                    child:
                        Text(S.of(context).action_confirm_and_reserve_ride))),
          ],
        )
      ]),
    );
  }
}
