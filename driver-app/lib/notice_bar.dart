import 'package:client_shared/theme/theme.dart';
import 'package:flutter/material.dart';

class NoticeBar extends StatelessWidget {
  final String title;
  const NoticeBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomTheme.primaryColors.shade50,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Color(0x14000000), offset: Offset(0, -3), blurRadius: 25)
          ]),
      child: SafeArea(
          top: false,
          minimum: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )),
    );
  }
}
