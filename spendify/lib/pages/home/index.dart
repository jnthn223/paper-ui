import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';
import 'package:spendify/pages/home/accounted.dart';
import 'package:spendify/pages/home/overview.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeOverView(),
          SizedBox(height: 20),
          AccountedCategories(),
        ],
      ),
    );
  }
}
