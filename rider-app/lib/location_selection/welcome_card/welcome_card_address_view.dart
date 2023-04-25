import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_gen/gen_l10n/messages.dart';

class WelcomeCardAddressView extends StatelessWidget {
  const WelcomeCardAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200),
          child: Icon(
            Icons.add,
            color: Colors.grey.shade600,
          ).p4(),
        ),
        Column(
          children: [
            Text(
              S.of(context).action_add_favorite_location,
              style: Theme.of(context).textTheme.titleMedium,
            ).p4()
          ],
        )
      ],
    );
  }
}
