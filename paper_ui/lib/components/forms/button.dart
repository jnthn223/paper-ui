import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/constants/sizes.dart';
import 'package:paper_ui/utils/paper_shadow.dart';

class Button extends StatefulWidget {
  final VoidCallback onPressed;
  final Sizes? size;
  final Color? bgColor;
  final Color? color;
  final Widget content;

  // Default constructor for text-based content
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

  Button.icon({
    Key? key,
    required this.onPressed,
    this.size = Sizes.sm,
    this.bgColor = Colors.white,
    this.color = Colors.black,
    IconData? icon,
  })  : content = Icon(
          icon ?? Icons.add_a_photo_sharp, // You can customize the default icon
          size: getFontSize(size!) + 5,
          color: color,
        ),
        super(key: key);

  // Constructor for content with icon
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

  // Named constructor for custom widget content
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
      return PaperShadow(
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
                    BorderRadius.circular(getButtonRadius(widget.size)),
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
