import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constant.dart';
import '../theme.dart';

class ToggleThemeBtn extends StatelessWidget {
  final ThemeChanger themeChanger;

  ToggleThemeBtn({this.themeChanger});

  @override
  Widget build(BuildContext context) {
    String currentMode = themeChanger.getThemeMode();
    Icon themeIcon = Icon(
      FontAwesome.moon_o,
      size: space * 3,
    );

    if (currentMode == 'dark') {
      themeIcon = Icon(
        FontAwesome5.sun,
        size: space * 3,
      );
    }

    return IconButton(
      icon: themeIcon,
      onPressed: () => themeChanger.toggleTheme(),
    );
  }
}
