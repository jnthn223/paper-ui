import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final Color bgColor;

  const IconCard({
    super.key,
    required this.icon,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon),
    );
  }
}
