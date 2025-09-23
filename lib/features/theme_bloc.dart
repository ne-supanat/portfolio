import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightMode);

  void toggleModel() {
    getCurrentStat();
    state == lightMode ? emit(darkMode) : emit(lightMode);
    getCurrentStat();
  }

  Icon getIcon() {
    if (state == lightMode) {
      return Icon(Icons.sunny, color: Colors.black);
    } else {
      return Icon(Icons.brightness_2, color: Colors.white);
    }
  }

  void getCurrentStat() {
    print(state == lightMode ? "on light mode" : "on dark mode");
  }
}
