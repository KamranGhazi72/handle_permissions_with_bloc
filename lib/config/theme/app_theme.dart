
import 'package:flutter/material.dart';
import 'package:handle_permissions_with_bloc/config/constants/app_colors.dart';
import 'package:handle_permissions_with_bloc/config/constants/font_style.dart';
import 'package:handle_permissions_with_bloc/config/constants/text_sizes.dart';

class AppTheme {
  final AppColors chosenColor;

  AppTheme(
      this.chosenColor,
      );

  ThemeData getTheme() {
    final sizes = AppValues();

    return ThemeData(
      fontFamily: fontFamilyName,
      colorScheme: ColorScheme.fromSeed(
        background: chosenColor.backgroundColor,
        seedColor: chosenColor.primaryColor,
        primary: chosenColor.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: chosenColor.primaryColor,
        foregroundColor: chosenColor.backgroundColor,
        titleTextStyle: TextStyle(
          fontFamily: fontFamilyName,
          fontSize: sizes.appBarText,
          color: chosenColor.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: chosenColor.textColor,
          fontSize: sizes.normalText,
          fontFamily: fontFamilyName,
        ),
        headlineLarge: TextStyle(
          color: chosenColor.textColor,
          fontSize: sizes.largeText,
          fontFamily: fontFamilyName,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(chosenColor.primaryColor),
          foregroundColor:
          MaterialStateProperty.all<Color>(chosenColor.whiteColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              fontSize: sizes.smallText,
              fontFamily: fontFamilyName,
            ),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(chosenColor.primaryColor),
        overlayColor:
        MaterialStateProperty.all<Color>(chosenColor.backgroundColor),
        trackColor:
        MaterialStateProperty.all<Color>(chosenColor.backgroundColor),
        trackOutlineColor:
        MaterialStateProperty.all<Color>(chosenColor.backgroundColor),
      ),
    );
  }
}