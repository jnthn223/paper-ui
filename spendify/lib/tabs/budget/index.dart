import 'package:flutter/material.dart';
import 'package:paper_ui/components/cards/budgetCard.dart';
import 'package:paper_ui/paper_ui.dart';
import 'package:spendify/tabs/budget/topactions.dart';
import "package:spendify/tabs/budget/searchBar.dart" as _;

class BudgetTab extends StatelessWidget {
  const BudgetTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Button.icon(onPressed: () {}, icon: Icons.add),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const TopAction(),
            const SizedBox(height: 10, width: 20),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                BudgetCard(
                  title: "January 1st Payout",
                  startDate: "01/01/2024",
                  endDate: "01/31/2024",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
