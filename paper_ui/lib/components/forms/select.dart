import 'package:flutter/material.dart';

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
      hint: hint != null ? Text(hint!) : null,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      elevation: 2, // Adjust the elevation as needed
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 10), // Adjust padding as needed
      ),
      icon: const Icon(Icons.arrow_drop_down), // Add dropdown icon
      isExpanded: true,
    );
  }
}
