import 'package:flutter/material.dart';

class StickerDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('details'),
        ),
      ),
    );
  }
}
