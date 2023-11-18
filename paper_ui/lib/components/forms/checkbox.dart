import 'package:flutter/material.dart';
import 'package:paper_ui/constants/sizes.dart';

class CheckBox extends StatefulWidget {
  final Sizes? size;
  final Color? color;
  final Color? bgColor;
  final String? label;
  final bool value;
  final bool isDisabled;
  final void Function(bool?)? onChangeValue;

  const CheckBox({
    Key? key,
    this.size = Sizes.sm,
    this.color = Colors.black,
    this.bgColor = const Color(0xFFF3C522),
    this.label,
    required this.value,
    this.isDisabled = false,
    this.onChangeValue,
  }) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final Color disabledColor = widget.color!.withOpacity(0.5);
    final Color disabledBgColor = widget.bgColor!.withOpacity(0.5);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkResponse(
          radius: 15,
          onTap: widget.isDisabled
              ? null
              : () {
                  setState(() {
                    _isChecked = !_isChecked;
                    widget.onChangeValue?.call(_isChecked);
                  });
                },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.isDisabled ? disabledColor : widget.color!,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(9.0),
              color: _isChecked
                  ? widget.isDisabled
                      ? disabledBgColor
                      : widget.bgColor
                  : null,
            ),
            child: _isChecked
                ? Icon(
                    Icons.check_rounded,
                    size: getFontSize(widget.size),
                    color: widget.isDisabled ? disabledColor : widget.color,
                  )
                : SizedBox(
                    width: getFontSize(widget.size!),
                    height: getFontSize(widget.size!),
                  ),
          ),
        ),
        if (widget.label != null) const SizedBox(width: 8.0),
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: getFontSize(widget.size),
              color: widget.isDisabled ? disabledColor : widget.color,
            ),
          ),
      ],
    );
  }
}
