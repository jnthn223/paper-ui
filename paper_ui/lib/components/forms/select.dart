import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Select", type: Select)
Widget defaultSelect(BuildContext context) {
  return LayoutBuilder(
    builder: (_, constraints) => Select(
      width: constraints.maxWidth,
      // width: 24,
      options: ["Grapes", "Apple", "Orange"],
      selectedValue: "Grapes",
      onChanged: (String? value) {},
      size: Sizes.md,
      hint: context.knobs
          .stringOrNull(label: "Hint", initialValue: "Select Fruit"),
      iconBackgroundColor: context.knobs.colorOrNull(
          label: "Icon Background Color", initialValue: Colors.greenAccent),
    ),
  );
}

class Select extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final Sizes? size;
  final Color? iconBackgroundColor;
  final double? width;

  const Select({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.hint,
    this.size = Sizes.sm,
    this.iconBackgroundColor = Colors.greenAccent,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: width,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.rubik(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2)),
        alignLabelWithHint: true,
      ),
      textStyle: GoogleFonts.rubik(),
      enableSearch: false,
      enableFilter: false,
      requestFocusOnTap: false,
      hintText: hint!,
      dropdownMenuEntries: options.map(
        (String value) {
          return DropdownMenuEntry<String>(
            labelWidget: Text(
              value,
              style: GoogleFonts.rubik(

                  // fontSize: getFontSize(size),
                  ),
            ),
            value: value,
            label: value,
          );
        },
      ).toList(),
    );
  }

  Text selectText(String value) {
    return Text(
      value,
      style: GoogleFonts.rubik(
        color: Colors.black,
        fontSize: getFontSize(size),
      ),
    );
  }
}
