import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constant.dart';

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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: space, horizontal: space),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentPath == '/home'
              ? IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                )
              : IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
          Text(title, style: Theme.of(context).textTheme.headline2),
          IconButton(
            icon: Icon(FontAwesome5.user),
            onPressed: () {
              Future.delayed(
                Duration.zero,
                () => Navigator.pushNamed(context, '/profile'),
              );
            },
          ),
        ],
      ),
    );
  }
}
