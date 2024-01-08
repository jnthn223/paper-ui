import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/size.dart';
import 'package:paper_ui/utils/shadow.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Button',
  type: Button,
)
Button defaultButton(BuildContext context) {
  return Button(
    onPressed: () {},
    text: context.knobs.string(label: "Button Label", initialValue: "Button"),
    color: context.knobs
        .color(label: "Button Text Color", initialValue: Colors.black),
  );
}

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final Sizes? size;
  final Color? bgColor;
  final Color? color;
  final Widget content;

  /// Default constructor for text-based content
  ///  - [onPressed]: Callback function when the button is pressed.
  ///  - [text]: The text displayed on the button.
  ///  - [size]: The size of the button (default is Sizes.sm).
  ///  - [bgColor]: The background color of the button (default is Colors.white).
  ///  - [color]: The foreground color of the button (default is Colors.black).
  Button({
    Key? key,
    required this.onPressed,
    required String text,
    this.size = Sizes.sm,
    this.bgColor = Colors.white,
    this.color = Colors.black,
  })  : content = Text(
          text,
          style: GoogleFonts.rubik(
              color: color,
              fontSize: getFontSize(size),
              fontWeight: FontWeight.w600),
        ),
        super(key: key);

  /// [Button.icon]: Constructor for circular icon button.
  ///   - [onPressed]: Callback function when the button is pressed.
  ///   - [size]: The size of the button (default is Sizes.sm).
  ///   - [bgColor]: The background color of the button (default is Colors.white).
  ///   - [color]: The foreground color of the button (default is Colors.black).
  ///   - [icon]: The icon displayed on the button (default is Icons.add_a_photo_sharp).
  Button.icon({
    Key? key,
    required this.onPressed,
    this.size = Sizes.sm,
    this.bgColor = Colors.white,
    this.color = Colors.black,
    IconData? icon,
  })  : content = Icon(
          icon ?? Icons.add_a_photo_sharp,
          size: getFontSize(size!) + 5,
          color: color,
        ),
        super(key: key);

  /// [Button.withIcon]: Constructor for button with icons that can be place on either/both sides.
  ///   - [onPressed]: Callback function when the button is pressed.
  ///   - [text]: The text displayed on the button.
  ///   - [size]: The size of the button (default is Sizes.sm).
  ///   - [bgColor]: The background color of the button (default is Colors.white).
  ///   - [color]: The foreground color of the button (default is Colors.black).
  ///   - [leftIcon]: The icon on the left side of the text.
  ///   - [rightIcon]: The icon on the right side of the text.
  Button.withIcon({
    Key? key,
    required this.onPressed,
    required String text,
    this.size = Sizes.sm,
    this.bgColor = Colors.white,
    this.color = Colors.black,
    IconData? leftIcon,
    IconData? rightIcon,
  })  : content = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftIcon != null) ...[
              Icon(leftIcon, size: getFontSize(size) + 5, color: color),
            ],
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.rubik(
                  color: color,
                  fontSize: getFontSize(size),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (rightIcon != null) ...[
              Icon(rightIcon, size: getFontSize(size) + 5, color: color),
            ],
          ],
        ),
        super(key: key);

  /// [Button.custom]: Named constructor for custom widget content.
  ///   - [onPressed]: Callback function when the button is pressed.
  ///   - [text]: The text displayed on the button.
  ///   - [size]: The size of the button (default is Sizes.sm).
  ///   - [bgColor]: The background color of the button (default is Colors.white).
  ///   - [color]: The foreground color of the button (default is Colors.black).
  ///   - [content]: Custom widget content for the button.
  const Button.custom({
    Key? key,
    required this.onPressed,
    required String text,
    this.size = Sizes.sm,
    this.bgColor = Colors.white,
    this.color = Colors.black,
    required this.content,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isClicked = false;

  void toggleClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.content is Icon) {
      return _buildIconButton();
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Shadow(
          clicked: isClicked,
          color: widget.color!,
          size: widget.size!,
          content: ElevatedButton(
            onPressed: () async {
              toggleClicked();
              await Future.delayed(const Duration(milliseconds: 200));
              toggleClicked();
              widget.onPressed();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.bgColor,
              foregroundColor: widget.color,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: getPadding(widget.size),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(getButtonRadius(widget.size) - 2),
              ),
            ),
            child: widget.content,
          ));
    });
  }

  Widget _buildIconButton() {
    return ElevatedButton(
      onPressed: () async {
        toggleClicked();
        await Future.delayed(const Duration(milliseconds: 200));
        toggleClicked();
        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        foregroundColor: widget.color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: getPadding(widget.size),
        shape: CircleBorder(
          side: BorderSide(
            color: widget.color!, // Specify the border color
            width: getButtonBorderSize(widget.size), // Specify the border width
          ),
        ),
      ),
      child: widget.content,
    );
  }
}
