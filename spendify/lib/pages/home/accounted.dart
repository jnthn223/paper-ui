import 'package:flutter/material.dart';
import 'package:paper_ui/components/cards/index.dart';
import 'package:paper_ui/paper_ui.dart' as paper;

class AccountedCategories extends StatelessWidget {
  const AccountedCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        paper.Label.heading1("Accounted Categories"),
        SizedBox(
          height: 10,
          width: 20,
        ),
        ListView(
          shrinkWrap: true,
          children: [
            paper.AccountedCategoriesCard(
                categoryName: 'Groceries', totalSpend: 30000),
          ],
        )
      ],
    );
  }
}
