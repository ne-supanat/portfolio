import 'package:flutter/material.dart';

import 'mobile/mobile_layout.dart';
import 'web_layout.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final displayWebLayout = MediaQuery.sizeOf(context).width > 950;
    return displayWebLayout ? WebLayout() : MobileLayout();
  }
}
