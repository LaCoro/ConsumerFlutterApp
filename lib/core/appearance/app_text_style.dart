import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {

  static TextStyle title = GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 28, color: Color(0xff383838)) ;//titulos
  static TextStyle appBar = GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff383838)) ;//Appbar
  static TextStyle section = GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff383838));//subsecciones
  static TextStyle boldWhite16 = GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xffffffff));//title store en ListStore
  static TextStyle boldBlack16 = GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xff383838));//title store en ListStore
  static TextStyle w500Black16 = GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff383838));//title popUp
  static TextStyle blue16 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xFF3D9FE6)); //en buscador blue
  static TextStyle black16 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xff383838));//direcciones y resultados busqueda
  static TextStyle grey16 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xff868686));//#resultados y sug busqueda
  static TextStyle grey14overline = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 14, color: Color(0xff868686),decoration: TextDecoration.lineThrough);//#resultados y sug busqueda
  static TextStyle yellow16 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xffFFAC0C)); //edit y chance, adress payment
  static TextStyle black14 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 14, color: Color(0xff383838));//horas abierto
  static TextStyle boldBlue13 = GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF3D9FE6));//envio gratis list_store
  static TextStyle w500Blue13 = GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF3D9FE6));//botones en popUp
  static TextStyle black13 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xff383838));//horario Store
  static TextStyle grey13 = GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xff868686));//subtitle store
  static TextStyle yellow13 = GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xffFFAC0C));


}