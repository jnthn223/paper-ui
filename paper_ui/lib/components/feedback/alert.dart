import 'package:flutter/material.dart';
import 'package:paper_ui/components/forms/button.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // use flutter's dialog
      child: Text("Hello"),
    );
  }
}
