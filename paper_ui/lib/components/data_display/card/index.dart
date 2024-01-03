import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget content;
  final Color? background;
  final Widget? header;
  final Widget? footer;
  const Card({
    super.key,
    required this.content,
    this.background,
    this.header,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 4))
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black,
                width: 2,
              ))),
              child: header,
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: content,
          ),
          if (footer != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: Colors.black,
                width: 2,
              ))),
              child: footer,
            )
        ],
      ),
    );
  }
}
