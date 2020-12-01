import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('profile'),
        ),
      ),
    );
  }
}
