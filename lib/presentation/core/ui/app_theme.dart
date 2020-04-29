import 'package:LaCoro/presentation/core/ui/app_colors.dart';
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
        primaryIconTheme: IconThemeData(size: 24),
        accentIconTheme: IconThemeData(size: 28),
        textTheme: TextTheme(
          headline1: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          headline2: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          headline3: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
          headline4: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
          headline5: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          headline6: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.yellowAction),
          bodyText1: GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, color: Colors.black),
          bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          overline: GoogleFonts.roboto(fontSize: 20, color: AppColors.greyMedium, decoration: TextDecoration.lineThrough),
          caption: GoogleFonts.roboto(fontWeight: FontWeight.w300, fontSize: 16, color: AppColors.greyMedium),
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