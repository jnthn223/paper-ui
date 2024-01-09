// widgetbook.dart

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated directories variable
import 'widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const genericPhoneFramePainter =
        GenericPhoneFramePainter(innerBodyColor: Colors.white);
    var devices = [
      Devices.ios.iPhone13.copyWith(framePainter: genericPhoneFramePainter),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: Widgetbook.material(
        // Use the generated directories variable
        directories: directories,
        addons: [
          DeviceFrameAddon(
            devices: devices,
            initialDevice: devices[0],
          ),
          AlignmentAddon(
            initialAlignment: Alignment.center,
          ),
          MaterialThemeAddon(
            themes: [
              WidgetbookTheme(
                name: 'Light',
                data: ThemeData.light(),
              ),
              WidgetbookTheme(
                name: 'Dark',
                data: ThemeData.dark(),
              ),
            ],
            initialTheme: WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
          ),
        ],
        integrations: [
          // To make addons & knobs work with Widgetbook Cloud
          WidgetbookCloudIntegration(),
        ],
      ),
    );
  }
}
