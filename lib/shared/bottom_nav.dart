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
      backgroundColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(AntDesign.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesome.user_o),
          label: 'Profile',
        )
      ].toList(),
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // do nothing
            break;
          case 1:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
