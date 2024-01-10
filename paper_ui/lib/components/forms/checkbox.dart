import 'package:flutter/material.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: "Default Checkbox", type: CheckBox)
Widget defaultCheckBox(BuildContext context) {
  return CheckBox(
    value: context.knobs.boolean(label: "Value", initialValue: false),
    label: context.knobs
        .stringOrNull(label: "Label", initialValue: "Checkbox Label"),
    isDisabled: context.knobs.boolean(label: "isDisabled"),
    crossed: context.knobs.boolean(label: "crossed"),
  );
}

class CheckBox extends StatefulWidget {
  final Sizes? size;
  final Color? color;
  final Color? bgColor;
  final String? label;
  final double? spacing;
  final bool value;
  final bool isDisabled;
  final void Function(bool?)? onChangeValue;
  final IconData? icon;
  final bool? crossed;

  // const CheckBox.crossed({
  //   Key? key,
  //   this.size = Sizes.sm,
  //   this.color = Colors.black,
  //   this.bgColor = const Color(0xFFF3C522),
  //   this.label,
  //   required this.value,
  //   this.isDisabled = false,
  //   this.onChangeValue,
  //   this.spacing = 8.0,
  //   this.icon = Icons.remove,
  //   this.crossed = true,
  // }) : super(key: key);

  const CheckBox({
    Key? key,
    this.size = Sizes.sm,
    this.color = Colors.black,
    this.bgColor = const Color(0xFFF3C522),
    this.label,
    required this.value,
    this.isDisabled = false,
    this.onChangeValue,
    this.spacing = 8.0,
    this.icon = Icons.check_rounded,
    this.crossed = false,
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
                    widget.icon,
                    size: getFontSize(widget.size),
                    color: widget.isDisabled ? disabledColor : widget.color,
                  )
                : SizedBox(
                    width: getFontSize(widget.size!),
                    height: getFontSize(widget.size!),
                  ),
          ),
        ),
        if (widget.label != null) SizedBox(width: widget.spacing),
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: getFontSize(widget.size),
              color: widget.isDisabled ? disabledColor : widget.color,
              decorationThickness: 1.5,
              decoration: (widget.crossed! && _isChecked)
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
      ],
    );
  }
}
