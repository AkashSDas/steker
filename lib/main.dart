import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:steker/theme.dart';

import './screens/screens.dart';
import 'constant.dart' as Constant;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger('dark'),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeChanger = Provider.of<ThemeChanger>(context);

    if (_themeChanger.getThemeMode() == 'dark') {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Constant.gray5,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Constant.gray5,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Constant.gray0,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Constant.gray0,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Firebase Analytics
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],

      // Named Routes
      routes: {
        '/': (context) => LoginScreen(),
        // '/home': (context) => HomeScreen(),
        // '/about': (context) => AboutScreen(),
        // '/sticker-details': (context) => StickerDetailsScreen(),
        // '/upload-image': (context) => UploadImageScreen(),
        // '/profile': (context) => ProfileScreen(),
      },

      // Theme
      theme: _themeChanger.getThemeData(),
    );
  }
}
