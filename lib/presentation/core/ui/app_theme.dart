import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData build() => ThemeData(
        primaryColor: Color(0xffffffff),
        primaryColorDark: Color(0xffffffff),
        primaryColorLight: Color(0xffffffff),
        accentColor: Color(0xff3D9FE6),
        backgroundColor: Color(0xFFF7F7F7),
        brightness: Brightness.light,
        dividerColor: Color(0xFFC7CBD3),
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
