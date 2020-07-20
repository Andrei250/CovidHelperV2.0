import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimaryColor = Color.fromRGBO(13, 10, 11, 1);
  static const Color _lightPrimaryVariantColor = Color.fromRGBO(69, 73, 85, 1);
  static const Color _lightLightColor = Color.fromRGBO(243, 239, 245, 1);
  static const Color _lightAccentColor = Color.fromRGBO(114, 176, 29, 1);
  static const Color _lightSecondaryAccentColor =
      Color.fromRGBO(63, 125, 32, 1);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryColor,
    appBarTheme: AppBarTheme(
      color: _lightPrimaryVariantColor,
      iconTheme: IconThemeData(color: _lightLightColor),
    ),
    colorScheme: ColorScheme(
        primary: _lightPrimaryColor,
        primaryVariant: _lightPrimaryVariantColor,
        secondary: _lightAccentColor,
        onPrimary: _lightSecondaryAccentColor),
  );
}
