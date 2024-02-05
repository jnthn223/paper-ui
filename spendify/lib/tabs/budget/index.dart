import 'package:flutter/material.dart';
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
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TopAction(),
            Text("Hello"),
          ],
        ),
      ),
    );
  }
}
