import 'package:flutter/material.dart';
import 'package:portfolio/widgets/theme_button.dart';

class MobileBaseLayout extends StatelessWidget {
  const MobileBaseLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Stack(
        children: [
          child,
          Positioned(top: -8, right: -8, child: ThemeButton()),
        ],
      ),
    );
  }
}
