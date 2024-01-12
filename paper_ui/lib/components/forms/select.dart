import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Select", type: Select)
Widget defaultSelect(BuildContext context) {
  return Select(
    options: ["Grapes", "Apple", "Orange"],
    selectedValue: "Grapes",
    onChanged: (String? value) {},
    iconBackgroundColor: context.knobs.colorOrNull(
        label: "Icon Background Color", initialValue: Colors.greenAccent),
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
    return DropdownMenu(
      menuStyle: MenuStyle(),
      enableFilter: true,
      requestFocusOnTap: true,
      inputDecorationTheme: const InputDecorationTheme(
        // filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      textStyle: GoogleFonts.rubik(fontSize: getFontSize(size)),
      dropdownMenuEntries: options.map(
        (String value) {
          return DropdownMenuEntry<String>(
            labelWidget: Text(
              value,
              style: GoogleFonts.rubik(
                fontSize: getFontSize(size),
              ),
            ),
            value: value,
            label: value,
          );
        },
      ).toList(),
    );
    // return DropdownButtonFormField(
    //   items: options.map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: selectText(value),
    //     );
    //   }).toList(),
    //   isExpanded: true,
    //   isDense: false, // Set this to false to make the dropdown width extended
    //   itemHeight: null,
    //   decoration: InputDecoration(
    //     hintText: hint,
    //     filled: true,
    //     fillColor: Colors.red,
    //   ),
    //   alignment: Alignment.center,
    //   dropdownColor: Colors.blue,
    //   onChanged: onChanged,
    // );
    // return DropdownButtonFormField<String>(
    //   value: selectedValue,
    //   onChanged: onChanged,
    //   hint: hint != null ? selectText(hint!) : null,
    // items: options.map<DropdownMenuItem<String>>((String value) {
    //   return DropdownMenuItem<String>(
    //     value: value,
    //     child: selectText(value),
    //   );
    // }).toList(),
    //   elevation: 0,
    //   focusColor: Colors.red,
    //   decoration: InputDecoration(
    //     focusedBorder: selectOutlineBorder(),
    //     enabledBorder: selectOutlineBorder(),
    //     suffixIcon: selectSuffixIcon(),
    //     contentPadding: const EdgeInsets.symmetric(
    //         vertical: 5, horizontal: 5), // Adjust padding as needed
    //   ),
    //   icon: const SizedBox.shrink(),
    //   // isExpanded: true,
    // );
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
      width: 25,
      height: 60,
      margin: EdgeInsets.zero,
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
