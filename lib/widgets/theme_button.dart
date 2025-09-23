import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/theme_bloc.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ThemeCubit>().toggleModel(),
      icon: context.read<ThemeCubit>().getIcon(),
    );
  }
}
