import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:steker/shared/btn.dart';

import '../constant.dart';
import '../theme.dart';

class CustomAppBar extends StatelessWidget {
  final String currentPath;
  final String goBackTo;
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppBar({
    this.title,
    this.currentPath,
    this.goBackTo,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: space, horizontal: space),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentPath == '/home'
              ? IconButton(
                  icon: Icon(FontAwesome.bars),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                )
              : IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
          Text(title, style: Theme.of(context).textTheme.headline2),
          ToggleThemeBtn(themeChanger: _themeChanger),
        ],
      ),
    );
  }
}
