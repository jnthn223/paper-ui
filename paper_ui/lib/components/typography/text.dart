import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as materialText;
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/sizes.dart';

class Text extends StatelessWidget {
  final String data;
  final Sizes? size;
  final Color? color;
  final TextStyle? style;

  const Text(
    this.data, {
    super.key,
    this.size,
    this.color,
    this.style,
  });

  Text.h1(
    this.data, {
    super.key,
    this.size,
    this.color,
  }) : style = GoogleFonts.rubik(fontSize: 30, color: color);

  @override
  Widget build(BuildContext context) {
    return materialText.Text(
      data,
      style: style,
    );
  }
}
