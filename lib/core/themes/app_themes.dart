import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    dividerColor: Colors.black,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.borderColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      foregroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.black, size: 24),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.borderColor),
      headlineSmall: TextStyle(color: AppColors.borderColor),
      headlineMedium: TextStyle(color: AppColors.borderColor),
      bodySmall: TextStyle(color: AppColors.borderColor),
      bodyLarge: TextStyle(color: AppColors.borderColor),
      bodyMedium: TextStyle(color: AppColors.borderColor),
      titleLarge: TextStyle(color: AppColors.borderColor),
      titleMedium: TextStyle(color: AppColors.borderColor),
      titleSmall: TextStyle(color: AppColors.borderColor),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.darkModColor, textTheme: ButtonTextTheme.primary),
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    colorScheme: ColorScheme.light(
      primary: AppColors.darkColor,
      secondary: AppColors.buttonColor,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.borderColor,
      hintStyle: TextStyle(color: AppColors.borderColor),
      border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor)),
      labelStyle: TextStyle(color: AppColors.borderColor),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor)),
    ),
    cardTheme: CardTheme(color: AppColors.borderColor),
  );

  static final darkTheme = ThemeData(
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.darkModColor),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkModColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkModColor,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white, size: 24),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.scaffoldBackgroundColor),
      headlineSmall: TextStyle(color: AppColors.whiteSpot),
      headlineMedium: TextStyle(color: AppColors.whiteSpot),
      bodySmall: TextStyle(color: AppColors.whiteSpot),
      bodyLarge: TextStyle(color: AppColors.whiteSpot),
      bodyMedium: TextStyle(color: AppColors.whiteSpot),
      titleLarge: TextStyle(color: AppColors.whiteSpot),
      titleMedium: TextStyle(color: AppColors.whiteSpot),
      titleSmall: TextStyle(color: AppColors.whiteSpot),
      
      
    ),
    iconTheme: const IconThemeData(color: Colors.white, size: 24),
    colorScheme: ColorScheme.dark(
      primary: AppColors.scaffoldBackgroundColor,
      secondary: AppColors.buttonColor,
      surface: AppColors.cardColor3,
      onSurface: AppColors.borderColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      
      border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor)),
      labelStyle: TextStyle(color: AppColors.borderColor ),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.appBarColor)),
    ),
    dividerColor: Colors.black,
    cardTheme: CardTheme(color: AppColors.whitecolorSpot),
  );
}
