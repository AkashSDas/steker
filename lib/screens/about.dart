import 'package:flutter/material.dart';

import '../constant.dart' as Constant;
import '../shared/app_bar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAppBar(title: 'about'),
            SizedBox(height: Constant.space * 4),
            Text('steker', style: Theme.of(context).textTheme.headline1),
            SizedBox(height: Constant.space * 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Constant.space * 2),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: 'steker ',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    TextSpan(text: 'is a all in one sticker app for your fun'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
