import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('steker', style: Theme.of(context).textTheme.headline1),
            RichText(
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
            LoginBtn(
              icon: FontAwesome.google,
              text: 'LOGIN WITH GOOGLE',
              loginMethod: () {},
              color: Theme.of(context).accentColor,
            ),
            // LoginBtn(
            //   text: 'Continue as Guest',
            //   loginMethod: () {},
            // ),
            FlatButton(
              child: Text(
                'Continue as Guest',
                style: Theme.of(context).textTheme.headline6,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class LoginBtn extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function loginMethod;

  LoginBtn({
    Key key,
    this.color,
    this.icon,
    this.loginMethod,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Theme.of(context).textTheme.bodyText1.color),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        label: Expanded(
          child: Text(
            '$text',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
