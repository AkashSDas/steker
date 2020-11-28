import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constant.dart' as Constant;

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      backgroundColor: Theme.of(context).primaryColor,
      animationDuration: Duration(milliseconds: 500),
      curve: Curves.bounceInOut,
      items: [
        BottomNavyBarItem(
          activeColor: Constant.blue,
          inactiveColor: Constant.purple,
          icon: Icon(Icons.home),
          title: Text(
            'home',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        BottomNavyBarItem(
          activeColor: Constant.blue,
          inactiveColor: Constant.purple,
          icon: Icon(Icons.image_search),
          title: Text(
            'gallery',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        BottomNavyBarItem(
          activeColor: Constant.blue,
          inactiveColor: Constant.orange,
          icon: Icon(Icons.camera_alt_outlined),
          title: Text(
            'camera',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        BottomNavyBarItem(
          activeColor: Constant.blue,
          inactiveColor: Constant.pink,
          icon: Icon(FontAwesome5.user_circle),
          title: Text(
            'profile',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ].toList(),
      onItemSelected: (int idx) {
        switch (idx) {
          case 0:
            // do nothing
            break;
          case 1:
            // TODO: go to gallery
            break;
          case 2:
            // TODO: open camera
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      // fixedColor: Constant.blue,
    );
  }
}
