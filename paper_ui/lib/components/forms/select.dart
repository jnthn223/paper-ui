import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Select", type: Select)
Widget defaultSelect(BuildContext context) {
  return Select(
    options: [
      context.knobs.list(
          label: "Options",
          initialOption: "Grapes",
          options: ["Apple", "Orange", "Grapes"])
    ],
    selectedValue: "Apple",
    onChanged: (String? value) {},
  );
}

class Select extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final Sizes? size;
  final Color? iconBackgroundColor;

  const Select({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.hint,
    this.size = Sizes.sm,
    this.iconBackgroundColor = Colors.greenAccent,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: onChanged,
      hint: hint != null ? selectText(hint!) : null,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: selectText(value),
        );
      }).toList(),
      elevation: 0,
      decoration: InputDecoration(
        focusedBorder: selectOutlineBorder(),
        enabledBorder: selectOutlineBorder(),
        suffixIcon: selectSuffixIcon(),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 10), // Adjust padding as needed
      ),
      icon: const SizedBox.shrink(),
      isExpanded: true,
    );
  }

  Text selectText(String value) {
    return Text(
      value,
      style: GoogleFonts.rubik(
        color: Colors.black,
        fontSize: getFontSize(size),
        height: 1.0,
      ),
    );
  }

  Container selectSuffixIcon() {
    return Container(
      width: 20,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          topLeft: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the icon
        child: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
          size: getFontSize(size) + 5,
        ),
      ),
    );
  }

  OutlineInputBorder selectOutlineBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}
