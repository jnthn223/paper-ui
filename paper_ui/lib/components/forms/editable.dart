import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/components/forms/input.dart';
import 'package:paper_ui/constants/sizes.dart';

class Editable extends StatefulWidget {
  final String text;
  final Sizes? size;
  final void Function(String)? onChanged;

  const Editable({
    Key? key,
    required this.text,
    this.onChanged,
    this.size = Sizes.sm,
  }) : super(key: key);

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
              autoFocus: true,
              onLoseFocus: () {
                setState(() {
                  isEditing = false;
                });
              },
              onChange: (newValue) {
                setState(() {
                  isEditing = false;
                  widget.onChanged?.call(newValue);
                });
              },
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.text,
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: getFontSize(widget.size),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
