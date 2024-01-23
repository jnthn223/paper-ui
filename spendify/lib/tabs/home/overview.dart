import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';

class HomeOverView extends StatelessWidget {
  const HomeOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label.heading1("Overview"),
        SizedBox(
          height: 10,
          width: 20,
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        )
      ],
    );
  }
}
