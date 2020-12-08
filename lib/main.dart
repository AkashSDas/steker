import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/screens.dart';
import './services/services.dart';
import './shared/shared.dart';
import './theme.dart';
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
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,

      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              StreamProvider<User>.value(value: AuthService().user),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,

              // Firebase Analytics
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
              ],

              // Named Routes
              routes: {
                '/': (context) => LoginScreen(),
                '/home': (context) => HomeScreen(),
                '/about': (context) => AboutScreen(),
                '/sticker-details': (context) => StickerDetailsScreen(),
                '/profile': (context) => ProfileScreen(),
              },

              // Theme
              theme: _themeChanger.getThemeData(),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingScreen();
      },
    );
  }
}
