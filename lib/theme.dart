import 'package:flutter/cupertino.dart';

class Theme {
  static CupertinoThemeData lightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF6200EE),
    primaryContrastingColor: Color(0xFF03DAC6),
    scaffoldBackgroundColor: CupertinoColors.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: CupertinoColors.white,
      textStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 18.0,
        color: CupertinoColors.black,
      ),
      navActionTextStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 18.0,
        color: CupertinoColors.white,
      ),
      navLargeTitleTextStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 34.0,
        color: CupertinoColors.white,
      ),
      navTitleTextStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 18.0,
        color: CupertinoColors.white,
      ),
      actionTextStyle: TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 18.0,
        color: CupertinoColors.white,
      ),
    ),
  );
}
