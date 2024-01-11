import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "Default", type: InputText)
Widget defaultInputText(BuildContext context) {
  return InputText(
    hint: context.knobs
        .string(label: "Hint", initialValue: "Enter your first name"),
    label: context.knobs.string(label: "Label", initialValue: "First Name"),
    onChange: (String value) {},
    autoFocus: context.knobs.booleanOrNull(
      label: "autoFocus",
      initialValue: false,
    ),
  );
}

@UseCase(name: "Underlined", type: InputText)
Widget underlinedInputText(BuildContext context) {
  return InputText.underline(
    onChange: (String value) {},
    initialValue: context.knobs
        .stringOrNull(label: "Initial Value", initialValue: "First Name"),
    autoFocus: context.knobs.booleanOrNull(
      label: "autoFocus",
      initialValue: false,
    ),
  );
}

class InputText extends StatefulWidget {
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChange;
  final InputDecoration? decoration;
  final String? initialValue;
  final Sizes? size;
  final TextInputType? inputType;
  final Function()? onLoseFocus;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final TextEditingController? textController;

  InputText({
    super.key,
    required String hint,
    required String label,
    Color? color = Colors.black,
    Color? errorColor = Colors.redAccent,
    this.readOnly = false,
    this.enabled,
    this.validator,
    required this.onChange,
    this.obscureText = false,
    this.initialValue,
    this.inputType,
    this.onLoseFocus,
    this.size,
    this.autoFocus,
    this.suffixIcon,
    this.textController,
  }) : decoration = InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 2.0, // Specify the border width
            ),
          ),
          floatingLabelStyle: GoogleFonts.rubik(color: color, fontSize: 18),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2.0, color: color!),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2.0, color: errorColor!),
          ),
          label: Text(label),
        );
  InputText.underline({
    super.key,
    this.obscureText = false,
    this.readOnly = true,
    this.enabled = true,
    this.validator,
    required this.onChange,
    this.initialValue,
    this.inputType,
    this.onLoseFocus,
    this.size,
    this.autoFocus,
    this.textController,
    this.suffixIcon,
  }) : decoration = const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.black),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.redAccent),
          ),
        );

  const InputText.unstyled({
    super.key,
    this.obscureText = false,
    this.readOnly = true,
    this.enabled = true,
    this.validator,
    required this.onChange,
    this.decoration,
    this.initialValue,
    this.inputType,
    this.onLoseFocus,
    this.size,
    this.autoFocus,
    this.suffixIcon,
    this.textController,
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    // Set the initial value when the widget is initialized
    // Initialize the _textEditingController using the widget.textController
    if (widget.textController != null) {
      _textEditingController = widget.textController!;
    } else {
      // Create a new TextEditingController if widget.textController is null
      _textEditingController =
          TextEditingController(text: widget.initialValue ?? "");
    }
  }

  IconButton _clearButton() {
    return IconButton(
      icon: Icon(Icons.clear, size: getFontSize(widget.size)),
      onPressed: textClear,
    );
  }

  void textClear() {
    print("Text Clear is pressed");
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var textfieldStyle = GoogleFonts.rubik(
      color: Colors.black,
      fontSize: getFontSize(widget.size ?? Sizes.sm),
    );
    var decorationWithIcon = widget.suffixIcon != null
        ? widget.decoration?.copyWith(suffixIcon: _clearButton())
        : widget.decoration;
    return DefaultTextStyle(
      style: textfieldStyle,
      softWrap: true,
      child: TextField(
        style: textfieldStyle,
        controller: _textEditingController,
        keyboardType: widget.inputType ?? TextInputType.text,
        obscureText: widget.obscureText!,
        enabled: widget.enabled,
        onChanged: (value) {
          widget.onChange(value);
        },
        onTapOutside: (PointerDownEvent event) {
          if (widget.onLoseFocus != null) {
            widget.onLoseFocus!();
          }
          FocusScope.of(context).unfocus();
        },
        cursorColor: Colors.black,
        decoration: decorationWithIcon,
        textAlignVertical: TextAlignVertical.center,
        autofocus: widget.autoFocus ?? false,
      ),
    );
  }
}
