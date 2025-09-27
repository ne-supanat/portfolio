import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/theme/theme.dart';
import 'features/main_view.dart';
import 'features/theme_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImages(context);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: state,
        theme: lightMode,
        darkTheme: darkMode,
        title: "Ne-Supanat",
        home: SelectableRegion(selectionControls: materialTextSelectionControls, child: MainView()),
      ),
    );
  }

  void precacheImages(BuildContext context) {
    final images = [
      AssetImage('assets/images/image_logo.png'),
      AssetImage('assets/icons/icon_github.png'),
      AssetImage('assets/icons/icon_profile.png'),
      AssetImage('assets/icons/icon_profile_active.png'),
      AssetImage('assets/icons/icon_work.png'),
      AssetImage('assets/icons/icon_work_active.png'),
      AssetImage('assets/icons/icon_education.png'),
      AssetImage('assets/icons/icon_education_active.png'),
      AssetImage('assets/icons/icon_award.png'),
      AssetImage('assets/icons/icon_award_active.png'),
      AssetImage('assets/icons/icon_project.png'),
      AssetImage('assets/icons/icon_project_active.png'),
    ];

    for (final image in images) {
      precacheImage(image, context);
    }
  }
}
