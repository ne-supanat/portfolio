import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/main.dart';
import 'package:portfolio/features/theme_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) => const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: state,
        home: SelectableRegion(selectionControls: materialTextSelectionControls, child: MainView()),
      ),
    );
  }
}
