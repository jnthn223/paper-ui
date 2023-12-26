import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';

class SelectDemo extends StatefulWidget {
  const SelectDemo({super.key});

  @override
  State<SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<SelectDemo> {
  String? selectedValue;
  void dropDownCallback(String? newSelectedValue) {
    setState(() {
      selectedValue = newSelectedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Select(
      options: const [
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
      ],
      hint: "Select Option",
      selectedValue: null,
      onChanged: (newValue) {
        if (newValue != null) {
          // Handle the selected value
          // You can update mySelectedValue here or perform any other actions
        }
      },
      size: Sizes.x2l,
      iconBackgroundColor: Colors.redAccent,
    );
  }
}
