import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatefulWidget {
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChange;
  final InputDecoration? decoration;
  final String? initialValue;
  final TextInputType? inputType;

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
  const InputText.underline({
    super.key,
    this.obscureText = false,
    this.readOnly = true,
    this.enabled = true,
    this.validator,
    required this.onChange,
    this.initialValue,
    this.inputType,
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
  });

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial value when the widget is initialized
    _textEditingController.text = widget.initialValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: widget.inputType ?? TextInputType.text,
      obscureText: widget.obscureText!,
      enabled: widget.enabled,
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.black,
      decoration: widget.decoration,
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
