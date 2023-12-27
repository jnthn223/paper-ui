import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_ui/components/forms/button.dart';
import 'package:paper_ui/constants/sizes.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: Colors.black, width: 2)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are you sure?",
                style: GoogleFonts.rubik(
                    fontSize: getFontSize(Sizes.x2l),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "This cannot be undone. Do you want to proceed?",
                style: GoogleFonts.rubik(
                  fontSize: getFontSize(Sizes.md),
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 2),
                ),
                color: Colors.grey),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Nope.",
                    bgColor: Colors.white,
                    color: Colors.black,
                    size: Sizes.md,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Button(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Yup!",
                    bgColor: Colors.black,
                    color: Colors.white,
                    size: Sizes.md,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
