import 'package:flutter/material.dart';
import 'package:paper_ui/constants/size.dart';

class Headline extends StatelessWidget {
  final String data;
  final Sizes? size;
  final Color? color;
  final TextStyle? style;

  const Headline(this.data, {super.key, this.size, this.color, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
