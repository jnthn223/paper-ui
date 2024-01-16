import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';

class Title extends StatelessWidget {
  final String data;
  final Sizes? size;
  final Color? color;
  final TextStyle? style;

  const Title(
    this.data, {
    super.key,
    this.size,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.rubik(
          fontSize: 24, color: color, fontWeight: FontWeight.bold),
    );
  }
}
