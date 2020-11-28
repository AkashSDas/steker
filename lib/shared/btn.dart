import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';
import '../theme.dart';

class ToggleThemeBtn extends StatelessWidget {
  final ThemeChanger themeChanger;

  ToggleThemeBtn({this.themeChanger});

  @override
  Widget build(BuildContext context) {
    String currentMode = themeChanger.getThemeMode();
    Icon themeIcon = Icon(
      FontAwesomeIcons.sun,
      size: space * 3,
    );

    if (currentMode == 'dark') {
      themeIcon = Icon(
        FontAwesomeIcons.moon,
        size: space * 3,
      );
    }

    return IconButton(
      icon: themeIcon,
      onPressed: () => themeChanger.toggleTheme(),
    );
  }
}
