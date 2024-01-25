import 'package:flutter/material.dart';
import 'package:spendify/tabs/budget/topactions.dart';

class BudgetTab extends StatelessWidget {
  const BudgetTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopAction(),
          SizedBox(height: 20),
          Text("Hello"),
        ],
      ),
    );
  }
}
