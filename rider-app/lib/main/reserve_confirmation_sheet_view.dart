import 'package:flutter/material.dart';
import 'package:client_shared/components/sheet_title_view.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class ReserveConfirmationSheetView extends StatelessWidget {
  const ReserveConfirmationSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SheetTitleView(title: S.of(context).ride_reserved_dialog_title),
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                  child: Text(
                S.of(context).ride_reserved_dialog_body,
                style: Theme.of(context).textTheme.bodyMedium,
              ).pOnly(right: 16)),
              Image.asset(
                "images/booking_confirmed.png",
                width: 200,
                height: 200,
              ).pSymmetric(v: 8)
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(8))),
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, 'reserves'),
                  child: Text(S.of(context).action_see_reserved_rides)
                      .pSymmetric(v: 8),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(S.of(context).action_confirm),
              ))
            ],
          )
        ],
      ),
    );
  }
}
