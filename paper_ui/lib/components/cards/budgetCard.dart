import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/components/cards/iconCard.dart';
import 'package:paper_ui/components/typography/index.dart';

class StatItem {
  final String name;
  final dynamic value;
  final Color color;
  final IconData icon;

  StatItem({
    required this.name,
    required this.value,
    required this.color,
    required this.icon,
  });
}

class BudgetCard extends StatelessWidget {
  final String startDate;
  final String endDate;
  final String title;
  final String budget;
  final String spent;
  final String saved;
  const BudgetCard({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.budget,
    required this.spent,
    required this.saved,
  });

  @override
  Widget build(BuildContext context) {
    String rangeDate = '$startDate ~ $endDate';
    var statItems = [
      StatItem(
        name: "Budget",
        value: budget,
        color: Colors.blue,
        icon: Icons.account_balance_wallet_outlined,
      ),
      StatItem(
        name: "Spent",
        value: spent,
        color: Colors.red,
        icon: Icons.attach_money_outlined,
      ),
      StatItem(
        name: "Saved",
        value: saved,
        color: Colors.green,
        icon: Icons.savings_outlined,
      ),
    ];
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0,
              color: Colors.black,
              offset: Offset(0, 2),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconCard(icon: Icons.calendar_today, bgColor: Colors.orange),
              SizedBox(width: 10),
              Text(
                rangeDate,
                style: GoogleFonts.rubik(color: Colors.grey),
              )
            ],
          ),
          SizedBox(height: 10),
          Label.heading1(title),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: statItems.map((item) => buildStatItem(item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildStatItem(StatItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconCard(
          icon: item.icon,
          bgColor: item.color,
        ),
        SizedBox(width: 5),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: GoogleFonts.rubik(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'P ${item.value}',
              style: GoogleFonts.rubik(
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}
