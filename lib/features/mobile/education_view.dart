import 'package:flutter/material.dart';
import '../../widgets/mobile_base_layout.dart';

import '../../widgets/timeline_section.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileBaseLayout(child: TimelineSection.education());
  }
}
