import 'package:flutter/material.dart';
import 'package:paper_ui/components/typography/index.dart';

class AccountedCategoriesCard extends StatelessWidget {
  final String categoryName;
  final int totalSpend;
  const AccountedCategoriesCard(
      {super.key, required this.categoryName, required this.totalSpend});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Label.heading2(categoryName),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.blue),
                      child: Icon(Icons.account_balance_wallet_outlined),
                    ),
                    Text("P30,000"),
                  ],
                )
              ],
            ),
            Container(
              width: 50,
              height: 100,
              decoration: BoxDecoration(color: Colors.green),
            )
          ],
        ));
  }
}
