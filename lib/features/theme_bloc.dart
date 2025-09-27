import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleModel() {
    getCurrentStat();
    isLightMode() ? emit(ThemeMode.dark) : emit(ThemeMode.light);
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
    return state == ThemeMode.light;
  }

  void getCurrentStat() {
    log(isLightMode() ? "on light mode" : "on dark mode");
  }
}
