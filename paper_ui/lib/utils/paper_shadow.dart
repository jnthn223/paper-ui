import 'package:flutter/material.dart';
import 'package:paper_ui/constants/sizes.dart';

class PaperShadow extends StatelessWidget {
  final Widget content;
  final bool? clicked;
  final Color color;
  final Sizes size;
  final bool isRound;

  const PaperShadow({
    Key? key,
    required this.content,
    this.clicked = false,
    required this.color,
    required this.size,
  })  : isRound = false,
        super(key: key);

  const PaperShadow.round({
    Key? key,
    required this.content,
    this.clicked,
    required this.color,
    required this.size,
  })  : isRound = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    bool isDarkTheme = theme.brightness == Brightness.dark;

    return LayoutBuilder(builder: (context, constraints) {
      return Transform.translate(
        offset: Offset(0, clicked! ? 2.0 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.transparent,
            border: Border.all(
              color: color,
              width: getButtonBorderSize(size),
            ),
            borderRadius: BorderRadius.circular(getButtonRadius(size)),
            boxShadow: isDarkTheme
                ? []
                : [
                    BoxShadow(
                      color: color,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(0, clicked! ? 0.0 : getShadowButtonSize(size)),
                    ),
                  ],
          ),
          child: content,
        ),
      );
    });
  }
}
