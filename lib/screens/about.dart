import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('about'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('about'),
        ),
      ),
    );
  }
}
