import 'package:flutter/material.dart';
import 'package:paper_ui/components/cards/index.dart';
import 'package:paper_ui/paper_ui.dart';

class AccountedCategories extends StatelessWidget {
  const AccountedCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label.heading1("Accounted Categories"),
        const SizedBox(height: 10, width: 20),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AccountedCategoriesCard(
                categoryName: 'Groceries', totalSpend: 30000),

            AccountedCategoriesCard(
                categoryName: 'Groceries', totalSpend: 30000),
            AccountedCategoriesCard(
                categoryName: 'Groceries', totalSpend: 30000),
            AccountedCategoriesCard(
                categoryName: 'Groceries', totalSpend: 30000),
            // ... other cards
          ],
        ),
      ],
    );
  }
}
