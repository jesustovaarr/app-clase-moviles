import 'package:flutter/material.dart';

class ThemeApp {

  static ThemeData warmTheme () {

    final theme = ThemeData.dark().copyWith(
      
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.grey,
        onPrimary: Colors.amber,
        secondary: Colors.red,
        onSecondary: Colors.green,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.greenAccent,
        onSurface: Colors.blueGrey
        )
    );
    return theme;

  }

}