import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                backgroundImage: NetworkImage(user.photoURL ?? ''),
              ),
            ),
          ),
          Container(
            child: Column(
              children: List.generate(4, (int index) {
                return ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
