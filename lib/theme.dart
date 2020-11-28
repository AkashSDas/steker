import 'package:flutter/material.dart';

import './constant.dart' as Constants;

class ThemeChanger extends ChangeNotifier {
  final lightThemeMode = {
    'mode': 'light',
    'themeData': Constants.lightThemeData,
  };

  final darkThemeMode = {
    'mode': 'dark',
    'themeData': Constants.darkThemeData,
  };

  Map<String, dynamic> themeDataInfo;

  ThemeChanger(String themeMode) {
    if (themeMode == 'light') {
      this.themeDataInfo = lightThemeMode;
    } else if (themeMode == 'dark') {
      this.themeDataInfo = darkThemeMode;
    }
  }

  ThemeData getThemeData() {
    return this.themeDataInfo['themeData'];
  }

  String getThemeMode() {
    return this.themeDataInfo['mode'];
  }

  void setDarkTheme() {
    this.themeDataInfo = darkThemeMode;
    notifyListeners();
  }

  void setLightTheme() {
    this.themeDataInfo = lightThemeMode;
    notifyListeners();
  }

  void toggleTheme() {
    if (this.themeDataInfo['mode'] == 'light') {
      this.themeDataInfo = darkThemeMode;
    } else if (this.themeDataInfo['mode'] == 'dark') {
      this.themeDataInfo = lightThemeMode;
    }
    notifyListeners();
  }
}
