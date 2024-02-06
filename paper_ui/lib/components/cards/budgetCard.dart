import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/components/cards/iconCard.dart';
import 'package:paper_ui/components/typography/index.dart';

class BudgetCard extends StatelessWidget {
  final String startDate;
  final String endDate;
  final String title;
  const BudgetCard({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    String rangeDate = '$startDate ~ $endDate';
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
          Text("Bottom"),
        ],
      ),
    );
  }
}
