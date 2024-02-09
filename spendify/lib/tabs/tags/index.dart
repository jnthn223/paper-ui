import 'package:flutter/material.dart';
import 'package:paper_ui/paper_ui.dart';
import 'package:spendify/tabs/budget/topactions.dart';

class TagsTab extends StatelessWidget {
  const TagsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Button.icon(onPressed: () {}, icon: Icons.add),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const TopAction(),
            const SizedBox(height: 10, width: 20),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
