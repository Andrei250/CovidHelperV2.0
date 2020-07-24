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
    appBarTheme: AppBarTheme(
      color: secondaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.lightBlueAccent,
      onPrimary: Colors.lightBlue,
      primaryVariant: Colors.lightBlueAccent,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.lightBlue,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontFamily: 'quicksand', color: lightColor, fontSize: 40.0),
        headline2: TextStyle(
            fontFamily: 'quicksand', color: lightColor, fontSize: 25.0),
        headline3: TextStyle(
            fontFamily: 'quicksand', color: lightColor, fontSize: 20.0),
        subtitle1: TextStyle(
            fontFamily: 'quicksand', color: lightColor, fontSize: 15.0),
        subtitle2: TextStyle(
            fontFamily: 'quicksand', color: lightColor, fontSize: 10.0)),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      buttonColor: lightColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: AppTheme.primaryVariantColor,
        ),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: AppTheme.lightColor,
          width: 1.5,
        ),
      ),
    ),
  );
}


final eLabel = TextStyle(
  color: AppTheme.primaryVariantColor,
  fontWeight: FontWeight.normal,
  fontFamily: 'quicksand',
);

final eLabelFocused = TextStyle(
  color: AppTheme.lightColor,
  fontWeight: FontWeight.bold,
);


