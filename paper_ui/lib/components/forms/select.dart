import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Select extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String? hint;

  const Select({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: onChanged,
      hint: hint != null
          ? Text(
              hint!,
              style: GoogleFonts.rubik(color: Colors.black),
            )
          : null,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.rubik(color: Colors.black),
          ),
        );
      }).toList(),
      elevation: 0,
      decoration: InputDecoration(
        focusedBorder: customOutlineBorder(),
        enabledBorder: customOutlineBorder(),
        suffixIcon: Container(
          width: 20,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0), // Add padding around the icon
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 10), // Adjust padding as needed
      ),
      icon: const SizedBox.shrink(),
      isExpanded: true,
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }
}
