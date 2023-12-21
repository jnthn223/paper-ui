import 'package:flutter/material.dart';
import 'package:paper_ui/components/forms/editable.dart';

class EditableDemo extends StatefulWidget {
  const EditableDemo({super.key});

  @override
  State<EditableDemo> createState() => _EditableDemoState();
}

class _EditableDemoState extends State<EditableDemo> {
  String defaultValue = "Hello";

  @override
  Widget build(BuildContext context) {
    return Editable(
      text: defaultValue,
      onChange: (newValue) {
        setState(() {
          print("Marker Demo receive " + newValue);
          defaultValue = newValue;
        });
      },
    );
  }
}
