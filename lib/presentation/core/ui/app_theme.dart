import 'package:LaCoro/presentation/core/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData build() => ThemeData(
      primaryColor: Color(0xff383838),
      primaryColorDark: Color(0xffffffff),
      primaryColorLight: Color(0xffffffff),
      accentColor: Color(0xFF3D9FE6),
      backgroundColor: Color(0xFFF7F7F7),
      disabledColor: AppColors.greyMedium,
      brightness: Brightness.light,
      dividerColor: Color(0xFFC7CBD3),
      fontFamily: GoogleFonts.roboto().fontFamily,
      primaryIconTheme: IconThemeData(size: 24),
      accentIconTheme: IconThemeData(size: 28),
      textTheme: TextTheme(
        bodyText1: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 28, color: Color(0xff383838)), //titulos
        bodyText2: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff383838)),//Appbar
        bodyText3: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff383838)),//subsecciones

        headline1: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff383838)),//title store en ListStore
        headline2: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff383838)),//title popUp
        headline3: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xFF3D9FE6)), //en buscador blue
        headline4: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xff383838)),//direcciones y resultados busqueda
        headline5: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xff868686)),//#resultados y sug busqueda
        headline6: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xffFFAC0C)), //edit y chance, adress payment

        subtitle1:  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF3D9FE6)),//envio gratis list_store
        subtitle2: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF3D9FE6)),//botones en popUp
        overline: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xff383838)),//horario Store
        button: GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xff868686)), //subtitle store
        caption: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xffFFAC0C))),

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
