import 'package:flutter/material.dart';
import 'package:steker/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('home'),
      // ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CustomAppBar(
                title: 'home',
                currentPath: '/home',
                scaffoldKey: _scaffoldKey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
