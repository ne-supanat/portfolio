import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/theme/theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightMode);

  void toggleModel() {
    getCurrentStat();
    isLightMode() ? emit(darkMode) : emit(lightMode);
    getCurrentStat();
  }

  Icon getIcon() {
    if (isLightMode()) {
      return Icon(Icons.sunny, color: Colors.black);
    } else {
      return Icon(Icons.brightness_2, color: Colors.white);
    }
  }

  bool isLightMode() {
    return state == lightMode;
  }

  void getCurrentStat() {
    log(isLightMode() ? "on light mode" : "on dark mode");
  }
}
