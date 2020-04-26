import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData build() => ThemeData(
        primaryColor: Color(0xffffffff),
        primaryColorDark: Color(0xffffffff),
        primaryColorLight: Color(0xffffffff),
        accentColor: Color(0xff3D9FE6),
        backgroundColor: Color(0xFFF7F7F7),
        brightness: Brightness.light,
        dividerColor: Color(0xFFC7CBD3),
        fontFamily: GoogleFonts.raleway().fontFamily,
        textTheme: TextTheme(
          headline1: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black),
          headline2: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          headline3: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          headline4: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          headline5: GoogleFonts.raleway(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black),
          headline6: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 20, color: yellowAction),
          bodyText1: GoogleFonts.raleway(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black),
          overline: GoogleFonts.raleway(fontSize: 20, color: graySubtitle, decoration: TextDecoration.lineThrough),
          caption: GoogleFonts.raleway(fontWeight: FontWeight.w300, fontSize: 16, color: graySubtitle),
          button: GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
Color graySubtitle = Color(0xFF868686);
Color accentColor = Color(0xff3D9FE6);
Color yellowAction = Color(0xFFFFAC0C);



