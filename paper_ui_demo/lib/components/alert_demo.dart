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
        return Alert();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Button(onPressed: () => _showMyDialog(), text: "Show Dialog");
  }
}
