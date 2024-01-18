import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';

class HomeOverView extends StatelessWidget {
  const HomeOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 400, maxWidth: 200),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(color: Colors.green),
          width: 20,
          height: 30,
        ),
      ),
    );
  }
}
