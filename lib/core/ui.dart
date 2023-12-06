import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromARGB(255, 255, 53, 39);
  static Color secondaryColor = Color.fromARGB(255, 247, 27, 56);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color transparentColor = Colors.transparent;
}

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    iconTheme: IconThemeData(color: AppColors.secondaryColor),
    colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor, secondary: AppColors.secondaryColor),
  );
}
