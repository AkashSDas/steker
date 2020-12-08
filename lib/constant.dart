import 'package:flutter/material.dart';

const double space = 10;

const blue = Color(0xFF5291EE);
const lightBlue = Color(0xFFEFFBFF);
const green = Color(0xFF13B755);
const purple = Color(0xFF8F53F1);
const orange = Color(0xFFFD7C1F);

const gray0 = Color(0xFFFDFCFC);
const gray1 = Color(0xFFD7D7D7);
const gray2 = Color(0xFF595959);
const gray3 = Color(0xFF1C1A1E);
const gray4 = Color(0xFF151515);
const gray5 = Color(0xFF0B0B0B);

const fontHead = 'Open Sans';
const fontBody = 'Nunito';

const boxShadow = BoxShadow(
  color: Colors.black12,
  blurRadius: 32.0,
  offset: Offset(0.0125, 0.0125),
);

final darkThemeData = ThemeData(
  iconTheme: IconThemeData(color: gray1),
  primaryColor: gray5,
  accentColor: gray3,
  bottomAppBarTheme: BottomAppBarTheme(
    color: gray3,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 80,
      color: blue,
      fontFamily: fontHead,
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
      fontSize: 30,
      color: blue,
      fontFamily: fontHead,
      fontWeight: FontWeight.w800,
    ),
    headline3: TextStyle(
      fontSize: 30,
      color: gray1,
      fontFamily: fontHead,
      fontWeight: FontWeight.w800,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: gray1,
      fontFamily: fontBody,
      fontWeight: FontWeight.w800,
    ),
    headline5: TextStyle(
      fontSize: 18,
      color: gray5,
      fontFamily: fontBody,
      fontWeight: FontWeight.w800,
    ),
    headline6: TextStyle(
      fontSize: 16,
      color: gray0,
      fontFamily: fontBody,
      fontWeight: FontWeight.w400,
    ),
    bodyText1: TextStyle(
      fontSize: 28,
      color: gray1,
      fontFamily: fontBody,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontSize: 24,
      color: gray1,
      fontFamily: fontBody,
      fontWeight: FontWeight.w400,
    ),
  ),
);

final lightThemeData = ThemeData(
  iconTheme: IconThemeData(color: gray5),
  primaryColor: gray0,
  accentColor: lightBlue,
  bottomAppBarTheme: BottomAppBarTheme(
    color: lightBlue,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 80,
      color: blue,
      fontFamily: fontHead,
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
      fontSize: 30,
      color: blue,
      fontFamily: fontHead,
      fontWeight: FontWeight.w800,
    ),
    headline3: TextStyle(
      fontSize: 30,
      color: gray4,
      fontFamily: fontHead,
      fontWeight: FontWeight.w800,
    ),
    headline4: TextStyle(
      fontSize: 24,
      color: gray4,
      fontFamily: fontBody,
      fontWeight: FontWeight.w800,
    ),
    headline5: TextStyle(
      fontSize: 18,
      color: gray0,
      fontFamily: fontBody,
      fontWeight: FontWeight.w800,
    ),
    headline6: TextStyle(
      fontSize: 16,
      color: gray0,
      fontFamily: fontBody,
      fontWeight: FontWeight.w800,
    ),
    bodyText1: TextStyle(
      fontSize: 28,
      color: gray4,
      fontFamily: fontBody,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontSize: 24,
      color: gray0,
      fontFamily: fontBody,
      fontWeight: FontWeight.w400,
    ),
  ),
);
