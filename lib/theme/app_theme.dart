
import 'package:flutter/material.dart';

class AppTheme{

  //primary color
  static Color primary = Colors.black;
  
  //Themelight
  static ThemeData light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: primary),
  );

  //Themelight
  static ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: primary),
  );
}