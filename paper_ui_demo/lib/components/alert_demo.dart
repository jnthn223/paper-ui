import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';

class AlertDemo extends StatefulWidget {
  const AlertDemo({super.key});

  @override
  State<AlertDemo> createState() => _AlertDemoState();
}

class _AlertDemoState extends State<AlertDemo> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Alert(
          actions: [
            Button(
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Nope.",
              bgColor: Colors.white,
              color: Colors.black,
              size: Sizes.md,
            ),
            // const SizedBox(
            //   width: 20,
            // ),
            Button(
              onPressed: () {
                Navigator.pop(context);
              },
              text: "Yup!",
              bgColor: Colors.black,
              color: Colors.white,
              size: Sizes.md,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Button(onPressed: () => _showMyDialog(), text: "Show Dialog");
  }
}
