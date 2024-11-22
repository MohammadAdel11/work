import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herafi/global/commonBorder.dart';
import 'package:herafi/global/screenSize.dart';

import 'FontFamily.dart';
import 'colors.dart';

// Define your theme colors

// Create a theme data for your app
final ThemeData themeData = ThemeData(
    primaryColor: ThemeColors.primaryColor,
    hintColor: ThemeColors.hintColor,
    scaffoldBackgroundColor: ThemeColors.primaryColor,
    focusColor: ThemeColors.goldColor,

    // Define text themes
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 25.sp,
          fontWeight: FontWeight.bold),
      displayLarge: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: ThemeColors.textColor, fontSize: 16.sp),
      displaySmall: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold), //buttonColor
      bodySmall: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold), //buttonColor
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.primaryColor,
      titleTextStyle: TextStyle(
          color: ThemeColors.textColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold),
      centerTitle: true,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 25.sp,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.white,
        titleTextStyle: TextStyle(
            color: ThemeColors.textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold)),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: ThemeColors.goldColor, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0.sp), // Rounded corners
        ),
        textStyle: TextStyle(
            fontFamily: ThemeFontFamily.Arial,
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
            color: ThemeColors.textColor),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: ThemeColors.textColor, fontSize: 13.sp),
      labelStyle: TextStyle(color: ThemeColors.textColor, fontSize: 13.sp),
      enabledBorder: commonBorder(),
      focusedBorder: commonBorder(),
      errorBorder: commonBorder(),
    ));
