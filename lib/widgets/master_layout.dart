// widgets/master_layout.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maham_website/widgets/footer.dart';
import 'package:maham_website/widgets/header_desktop.dart';

class MasterLayout extends StatelessWidget {
  final Widget child;

  const MasterLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderDesktop(), // Your persistent header
          Expanded(child: child), // Scrollable page content
          Footer(key: ValueKey(context.locale.languageCode)), // Your persistent footer
        ],
      ),
    );
  }
}