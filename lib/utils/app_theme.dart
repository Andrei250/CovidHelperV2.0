import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();

  static const Color primaryColor = Color.fromRGBO(13, 10, 11, 1);
  static const Color secondaryColor = Color.fromRGBO(37, 34, 35, 1);
  static const Color primaryVariantColor = Color.fromRGBO(69, 73, 85, 1);
  static const Color lightColor = Color.fromRGBO(243, 239, 245, 1);
  static const Color accentColor = Color.fromRGBO(114, 176, 29, 1);
  static const Color secondaryAccentColor = Color.fromRGBO(63, 125, 32, 1);

  static final ThemeData darkTheme = ThemeData(

    scaffoldBackgroundColor: primaryColor,
    buttonColor: Colors.red[400],

    appBarTheme: AppBarTheme(
      color: secondaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),

    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}
