import 'package:flutter/material.dart';
import 'package:spendify/tabs/budget/topactions.dart';
import "package:spendify/tabs/budget/searchBar.dart" as _;

class BudgetTab extends StatelessWidget {
  const BudgetTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TopAction(),
          Text("Hello"),
        ],
      ),
    );
  }
}
