import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';

class Label extends StatelessWidget {
  final String data;
  final Sizes? size;
  final Color? color;
  final TextStyle? style;

  const Label(
    this.data, {
    super.key,
    this.size,
    this.color,
    this.style,
  });

  Label.title(
    this.data, {
    super.key,
    this.size,
    this.color,
  }) : style = GoogleFonts.rubik(
            fontSize: 24, color: color, fontWeight: FontWeight.bold);

  Label.heading1(
    this.data, {
    super.key,
    this.size,
    this.color,
  }) : style = GoogleFonts.rubik(
            fontSize: 20, color: color, fontWeight: FontWeight.w500);
  Label.heading2(
    this.data, {
    super.key,
    this.size,
    this.color,
  }) : style = GoogleFonts.rubik(
            fontSize: 18, color: color, fontWeight: FontWeight.w500);
  Label.normal(
    this.data, {
    super.key,
    this.size,
    this.color,
  }) : style = GoogleFonts.rubik();

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
    );
  }
}
