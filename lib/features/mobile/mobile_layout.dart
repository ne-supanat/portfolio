import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/theme_bloc.dart';
import 'package:portfolio/theme/theme.dart';

import '../../widgets/side_project_section.dart';
import '../../widgets/theme_button.dart';
import '../../widgets/timeline_section.dart';
import 'profile_view.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color getBottomNavColor() =>
      context.read<ThemeCubit>().isLightMode() ? primaryColor : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: [
              ProfileView(),
              TimelineSection.work(),
              TimelineSection.education(),
              TimelineSection.award(),
              SideProjectSection(),
            ].elementAt(_selectedIndex),
          ),
          Positioned(top: 16, right: 16, child: ThemeButton()),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          textTheme: Theme.of(
            context,
          ).textTheme.copyWith(labelMedium: TextStyle(color: Colors.yellow)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: getBottomNavColor(),
          selectedIconTheme: Theme.of(context).iconTheme.copyWith(color: getBottomNavColor()),
          unselectedIconTheme: Theme.of(context).iconTheme.copyWith(color: getBottomNavColor()),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/icon_profile.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/icon_profile_active.png')),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/icon_work.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/icon_work_active.png')),
              label: 'Work',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/icon_education.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/icon_education_active.png')),
              label: 'Education',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/icon_award.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/icon_award_active.png')),
              label: 'Award',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/icon_project.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/icon_project_active.png')),
              label: 'Projects',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
