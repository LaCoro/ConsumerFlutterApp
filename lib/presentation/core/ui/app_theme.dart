import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData build() => ThemeData(
        primaryColor: Color(0xffffffff),
        primaryColorDark: Color(0xffffffff),
        primaryColorLight: Color(0xffffffff),
        accentColor: Color(0xFF3D9FE6),
        backgroundColor: Color(0xFFF7F7F7),
        brightness: Brightness.light,
        dividerColor: Color(0xFFC7CBD3),
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: TextTheme(
          headline1: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          headline2: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          headline3: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          headline4: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          headline5: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          headline6: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: yellowAction),
          bodyText1: GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black),
          bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          overline: GoogleFonts.roboto(fontSize: 20, color: grayMedium, decoration: TextDecoration.lineThrough),
          caption: GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, color: grayMedium),
          button: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),

        )

        //fontFamily: "Poppins", TODO
      );

  /// Wrap a widget to be affected for this theme
  ///
  /// Usage: AppTheme.darkTheme(child: Column(...))
  static Theme darkTheme({Widget child}) => Theme(
        // TODO
        data: build().copyWith(),
        child: child,
      );
}

/// Colors

Color greenLight = Color(0xFFBAF5CB);
Color greenDark = Color(0xFF339773);
Color grayMedium = Color(0xFF868686);
Color grayLight = Color(0xFFE5E5E5);
Color accentColor = Color(0xFF3D9FE6);
Color yellowAction = Color(0xFFFFAC0C);
Color divider = Color(0xFFC7CBD3);



