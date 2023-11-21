import 'package:flutter/material.dart';
import 'package:paper_ui/components/forms/input.dart';

class Editable extends StatefulWidget {
  final String text;
  final void Function(String)? onChanged;

  const Editable({Key? key, required this.text, this.onChanged})
      : super(key: key);

  @override
  _EditableState createState() => _EditableState();
}

class _EditableState extends State<Editable> {
  bool isEditing = false;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
      child: isEditing
          ? InputText.underline(
              initialValue: widget.text,
              onChange: (newValue) {
                setState(() {
                  isEditing = false;
                  widget.onChanged?.call(newValue);
                });
              },
            )
          : Text(widget.text),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
