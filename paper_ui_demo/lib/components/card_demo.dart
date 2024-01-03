import 'package:flutter/material.dart';
import 'package:paper_ui/components/forms/button.dart';
import 'package:paper_ui/paper_ui.dart' as paper;

class Card_Demo extends StatelessWidget {
  const Card_Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return paper.Card(
      // header: const Text("Header"),
      content: const Text("Hello"),
      // footer: const Text("Footer"),
    );
  }
}
