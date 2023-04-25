import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/messages.dart';

class LoginTokenEntryView extends StatefulWidget {
  const LoginTokenEntryView({Key? key}) : super(key: key);

  @override
  State<LoginTokenEntryView> createState() => _LoginTokenEntryState();
}

class _LoginTokenEntryState extends State<LoginTokenEntryView> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Enter the JWT",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Row(
              children: [
                const SizedBox(width: 5),
                Flexible(
                  child: TextField(
                    controller: myController,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final Box box = await Hive.openBox('user');
                box.put("jwt", myController.text);
                if (!mounted) return;
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15), elevation: 0),
              child: Text(
                S.of(context).action_next,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
