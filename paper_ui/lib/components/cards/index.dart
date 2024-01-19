import 'package:flutter/material.dart';
import 'package:paper_ui/components/typography/index.dart';

class Card extends StatelessWidget {
  final Widget body;

  const Card(this.body, {super.key});

  Card.accountedCategories(
      {super.key, required String categoryName, required int totalSpend})
      : body = Row(
          children: [Label.heading2(categoryName), Text("Hello")],
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body,
    );
  }
}
