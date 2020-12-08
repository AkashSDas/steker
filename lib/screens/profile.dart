import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart' as Constant;
import '../services/auth.dart';
import '../shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    AuthService _auth = AuthService();

    if (user != null) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(title: 'profile'),
              SizedBox(height: Constant.space * 4),
              CircleAvatar(
                radius: Constant.space * 10,
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: NetworkImage(
                  user.photoURL ??
                      'https://images.unsplash.com/photo-1582266255765-fa5cf1a1d501?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                ),
              ),
              SizedBox(height: Constant.space * 2),
              Text(
                user.displayName != null ? user.displayName : 'Guest',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: Constant.space * 2),
              Text(
                user.email != null ? user.email : 'No email address',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: Constant.space * 2),
              FlatButton(
                color: Constant.orange,
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                child: Text(
                  'logout',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return LoadingScreen();
    }
  }
}
