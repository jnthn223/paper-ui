import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  const TagCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 2,
      )),
    );
  }
}
