import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).textTheme.bodyText1.color,
        size: 20,
      ),
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).textTheme.headline2.color,
        size: 24,
      ),
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).textTheme.headline2.color,
      unselectedItemColor: Theme.of(context).textTheme.bodyText1.color,
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesome.home),
          label: 'Home',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesome5.images),
          label: 'Gallery',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesome.camera_retro),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesome5.user),
          label: 'Profile',
        )
      ].toList(),
      onTap: (int idx) {
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
    );
  }
}
