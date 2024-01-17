import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Label.heading1("Overview")],
    );
  }
}
