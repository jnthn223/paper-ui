import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart' as paper;
import 'package:paper_ui/constants/sizes.dart';
import 'package:paper_ui_demo/components/alert_demo.dart';
import 'package:paper_ui_demo/components/card_demo.dart';
import 'package:paper_ui_demo/components/select_demo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            paper.Button(
              onPressed: () {},
              text: "Button Label",
              size: Sizes.xl,
            ),
            const SizedBox(height: 12),
            paper.Button.withIcon(
              color: Colors.blueAccent,
              size: Sizes.md,
              onPressed: () {
                _showAlertDialog(context);
              },
              text: "Button With Icon",
              rightIcon: Icons.chevron_right_rounded,
            ),
            const SizedBox(height: 12),
            paper.Button.icon(
              onPressed: () {},
              bgColor: Colors.greenAccent,
              size: Sizes.lg,
            ),
            const SizedBox(height: 12),
            const paper.CheckBox.crossed(
              value: true,
              size: Sizes.x2l,
              label: "Hello World",
            ),
            paper.InputText(
              onChange: (value) {
                return;
              },
              hint: "Hello",
              label: "Hellox",
              initialValue: "Initial Value",
            ),
            const SizedBox(height: 12),
            paper.Editable(
              size: Sizes.x2l,
              onChange: (value) {},
              text: "Editable",
            ),
            const SizedBox(height: 12),
            const SelectDemo(),
            const SizedBox(height: 12),
            const AlertDemo(),
            const SizedBox(height: 12),
            const Card_Demo()
          ]),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert"),
          content: const Text("Button Clicked!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
