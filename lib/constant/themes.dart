import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  Themes._();

  static ThemeData base = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
  );

  static ThemeData light = base.copyWith(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
  );

  static ThemeData dark = base.copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
  );
}
