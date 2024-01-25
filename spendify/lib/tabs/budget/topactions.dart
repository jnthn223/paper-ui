import 'package:flutter/material.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:paper_ui/paper_ui.dart';

class TopAction extends StatelessWidget {
  const TopAction({super.key});

  @override
  Widget build(BuildContext context) {
    return InputText.unstyled(
      size: Sizes.xs,
      onChange: (value) {},
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2.0, color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2.0, color: Colors.grey),
        ),
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        prefixIconColor: Colors.grey,
      ),
    );
  }
}
