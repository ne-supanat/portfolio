import 'package:flutter/material.dart';

import '../../widgets/mobile_base_layout.dart';
import '../../widgets/side_project_section.dart';

class SideProjectsView extends StatelessWidget {
  const SideProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileBaseLayout(child: SideProjectSection());
  }
}
