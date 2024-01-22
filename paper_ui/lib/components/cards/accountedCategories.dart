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
        margin: EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.antiAlias,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Label.heading2(categoryName),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.account_balance_wallet_outlined),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Label.normal("Total Spend: P30,000"),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  )),
              child: Center(child: Label.heading2("30%")),
            )
          ],
        ));
  }
}
