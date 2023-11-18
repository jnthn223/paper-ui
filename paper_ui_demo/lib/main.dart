import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart' as paper;
import 'package:paper_ui/constants/sizes.dart';

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
            SizedBox(height: 12),
            paper.Button.withIcon(
              color: Colors.blueAccent,
              size: Sizes.md,
              onPressed: () {
                _showAlertDialog(context);
                print("Hello");
              },
              text: "Button With Icon",
              rightIcon: Icons.chevron_right_rounded,
            ),
            SizedBox(height: 12),
            paper.Button.icon(
              onPressed: () {},
              bgColor: Colors.greenAccent,
              size: Sizes.lg,
            ),
            SizedBox(height: 12),
            const paper.CheckBox.crossed(
              value: true,
              size: Sizes.x2l,
              label: "Hello Universe",
            ),
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
          title: Text("Alert"),
          content: Text("Button Clicked!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
