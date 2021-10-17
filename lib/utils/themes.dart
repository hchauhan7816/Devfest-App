import 'package:devfest/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    fontFamily: Devfest.googleSansFamily,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: Devfest.googleSansFamily,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 55.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: Colors.red[800],
    scaffoldBackgroundColor: Colors.black,
  );
}
