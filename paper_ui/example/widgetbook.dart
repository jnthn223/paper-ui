// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:paper_ui/components/forms/button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated directories variable
import 'main.dart';
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Widgetbook(
        // Use the generated directories variable
        directories: directories,
        addons: [],
        integrations: [
          // To make addons & knobs work with Widgetbook Cloud
          WidgetbookCloudIntegration(),
        ],
      ),
      routes: {
        '/': (context) =>
            PaperUIHomepage(), // Replace HomePage with your home page widget
        '/components/forms/button/button': (context) => Button(
              onPressed: () {},
              text: "Hello",
            ), // Replace ButtonPage with your button widget
      },
      builder: (BuildContext context, Widget? navigator) {
        return navigator ?? Container();
      },
    );
  }
}
