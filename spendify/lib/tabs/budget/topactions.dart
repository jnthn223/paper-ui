import 'package:flutter/material.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:paper_ui/paper_ui.dart';

class TopAction extends StatelessWidget {
  const TopAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return InputText(
              size: Sizes.md,
              hint: 'Search',
              label: 'Search',
              onChange: (value) {},
            );
          },
        )
      ],
    );
  }
}
