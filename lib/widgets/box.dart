import 'package:flutter/material.dart';

class AppBox extends StatelessWidget {
  const AppBox({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff7dc3ff)),
      ),
      child: child,
    );
  }
}
