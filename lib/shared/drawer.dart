import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Drawer(
      child: ListView(
        children: [
          Container(
            child: DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: NetworkImage(
                  user?.photoURL ??
                      'https://images.unsplash.com/photo-1582266255765-fa5cf1a1d501?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    FontAwesome.user_o,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  title: Text(
                    user?.displayName ?? 'Guest',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesome.exclamation_circle,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  title: Text(
                    'About',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesome.code,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  title: Text(
                    'Code',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
