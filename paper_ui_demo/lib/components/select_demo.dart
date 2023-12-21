import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';

class SelectDemo extends StatefulWidget {
  const SelectDemo({super.key});

  @override
  State<SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<SelectDemo> {
  @override
  Widget build(BuildContext context) {
    return Select(
      options: const [
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
        // 'Option 5',
        // 'Option 6',
        // 'Option 7',
        // 'Option 8',
        // 'Option 9',
        // 'Option 10',
        // 'Option 11',
        // 'Option 12',
        // 'Option 13',
        // 'Option 14',
        // 'Option 15',
        // 'Option 16',
        // 'Option 17',
        // 'Option 18',
        // 'Option 19',
        // 'Option 20',
      ],
      hint: "Select Option",
      selectedValue: null,
      onChanged: (newValue) {
        if (newValue != null) {
          // Handle the selected value
          // You can update mySelectedValue here or perform any other actions
        }
      },
    );
  }
}
