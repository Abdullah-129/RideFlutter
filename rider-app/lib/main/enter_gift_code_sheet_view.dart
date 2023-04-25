import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/sheet_title_view.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class EnterGiftCodeSheetView extends StatelessWidget {
  const EnterGiftCodeSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SheetTitleView(
              title: S.of(context).gift_card_title,
              closeAction: () => Navigator.pop(context),
            ),
            Text(S.of(context).gift_card_body,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Ionicons.gift),
                  hintText: S.of(context).gift_card_text_placeholder),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(S.of(context).action_apply))),
              ],
            )
          ],
        ));
  }
}
