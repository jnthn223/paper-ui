// Widgetbook file: widgetbook.dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:paper_ui/paper_ui.dart' as paper;

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [],
      directories: [
        WidgetbookComponent(
          name: "Typography",
          useCases: [
            WidgetbookUseCase(
              name: "Title",
              builder: (context) => paper.Text("Hello"),
            )
          ],
        )
      ],
    );
  }
}
