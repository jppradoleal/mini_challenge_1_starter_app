import 'package:flutter/material.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.blue[800]!,
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.white),
            subtitle1:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(color: Colors.white, height: 2),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.lightBlue[900]!,
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.white),
            subtitle1:
                TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(color: Colors.white, height: 2),
          ),
        );
      case ThemeType.Other:
        return ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.purple[100]!,
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.black87),
            subtitle1:
                TextStyle(color: Colors.black87, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(color: Colors.black87, height: 2),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
