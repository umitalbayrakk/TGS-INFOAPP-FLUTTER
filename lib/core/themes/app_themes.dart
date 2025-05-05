import 'package:flutter/material.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
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
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.darkModColor, textTheme: ButtonTextTheme.primary),
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    colorScheme: ColorScheme.light(
      primary: AppColors.darkColor, // Ana renk (örneğin, butonlar)
      secondary: AppColors.buttonColor, // İkincil renk (örneğin, vurgular)
      surface: Colors.white, // Yüzey rengi (kartlar, paneller)
      onSurface: Colors.black, // Yüzey üzerindeki metin/ikon rengi
      background: AppColors.scaffoldBackgroundColor, // Arka plan rengi
      onBackground: Colors.black, // Arka plan üzerindeki metin/ikon rengi
    ),
    inputDecorationTheme: const InputDecorationTheme(
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
    ),
    iconTheme: const IconThemeData(color: Colors.white, size: 24),
    colorScheme: ColorScheme.dark(
      primary: AppColors.scaffoldBackgroundColor,
      secondary: AppColors.buttonColor,
      surface: AppColors.cardColor3,
      onSurface: AppColors.borderColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.amber,
      border: OutlineInputBorder(borderSide: BorderSide(color: AppColors.borderColor)),
      labelStyle: TextStyle(color: AppColors.borderColor),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.appBarColor)),
    ),
    cardTheme: CardTheme(color: AppColors.whitecolorSpot),
  );
}
