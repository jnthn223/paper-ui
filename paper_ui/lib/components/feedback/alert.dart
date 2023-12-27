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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
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
            Text("This cannot be undone. Do you want to proceed?"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  onPressed: () {},
                  text: "Nope",
                  size: Sizes.md,
                ),
                Button(
                  onPressed: () {},
                  text: "Yes",
                  bgColor: Colors.black,
                  color: Colors.white,
                  size: Sizes.md,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
