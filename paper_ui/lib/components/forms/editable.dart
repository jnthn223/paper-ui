import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/components/forms/input.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Editable", type: Editable)
Widget defaultEditable(BuildContext context) {
  return Editable(
    text: context.knobs.string(label: "Text", initialValue: "Editable Text"),
    onChange: (value) {},
    size: Sizes.sm,
  );
}

class Editable extends StatefulWidget {
  final String text;
  final Sizes? size;
  final ValueChanged<String> onChange;

  const Editable({
    Key? key,
    required this.text,
    required this.onChange,
    this.size = Sizes.sm,
  }) : super(key: key);

  @override
  _EditableState createState() => _EditableState();
}

class _EditableState extends State<Editable> {
  bool isEditing = false;
  late TextEditingController _textEditingController;
  late String textValue;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.text);
    textValue = widget.text;
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
              textController: _textEditingController,
              initialValue: widget.text,
              autoFocus: true,
              onLoseFocus: () {
                setState(() {
                  isEditing = false;
                });
              },
              onChange: (value) {
                widget.onChange(textValue);
                setState(() {
                  textValue = value;
                });
              },
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Text(
                textValue,
                style: GoogleFonts.rubik(
                  color: Colors.black,
                  fontSize: getFontSize(widget.size),
                ),
              ),
            ),
    );
  }
}
