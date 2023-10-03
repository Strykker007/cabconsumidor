import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static final ThemeData lightTheme = ThemeData(
  //   primaryColor: Colors.blue,
  //   cupertinoOverrideTheme: const CupertinoThemeData(
  //     brightness: Brightness.light,
  //   ),
  //   scaffoldBackgroundColor: const Color(0xfff2f2f2),
  //   cardColor: Colors.white,
  //   brightness: Brightness.light,
  //   dividerTheme: const DividerThemeData(
  //     color: Colors.black,
  //   ),
  //   splashColor: Colors.transparent,
  //   highlightColor: Colors.transparent,
  //   textSelectionTheme: TextSelectionThemeData(
  //     cursorColor: const Color(0xFFFF8902),
  //     selectionColor: const Color(0xFF5865F2).withOpacity(0.5),
  //     selectionHandleColor: const Color(0xFFFF8902),
  //   ),
  //   iconTheme: const IconThemeData(
  //     color: Colors.blue,
  //   ),
  //   buttonTheme: const ButtonThemeData(
  //     buttonColor: Colors.blue,
  //   ),
  //   textTheme: TextTheme(
  //     displayLarge: TextStyle(
  //       fontFamily: GoogleFonts.inter().fontFamily,
  //       color: Colors.blue,
  //       fontSize: 25,
  //     ),
  //     displayMedium: TextStyle(
  //       fontFamily: GoogleFonts.inter().fontFamily,
  //       color: Colors.blue,
  //       fontSize: 22,
  //     ),
  //     displaySmall: TextStyle(
  //       fontFamily: GoogleFonts.inter().fontFamily,
  //       color: Colors.blue,
  //       fontSize: 20,
  //     ),
  //     headlineMedium: TextStyle(
  //       fontFamily: GoogleFonts.inter().fontFamily,
  //       color: Colors.blue,
  //       fontSize: 18,
  //     ),
  //     headlineSmall: TextStyle(
  //       fontFamily: GoogleFonts.inter().fontFamily,
  //       color: Colors.blue,
  //       fontSize: 16,
  //       height: 1.5,
  //     ),
  //     titleLarge: TextStyle(
  //       fontFamily: GoogleFonts.inter().fontFamily,
  //       color: Colors.blue,
  //       fontSize: 14,
  //       height: 1.5,
  //     ),
  //   ),
  //   colorScheme: const ColorScheme(
  //       background: Color(0xffffffff),
  //       brightness: Brightness.light,
  //       error: Colors.red,
  //       onError: Colors.red,
  //       onPrimary: Colors.white,
  //       onSecondary: Colors.black,
  //       onSurface: Colors.black,
  //       primary: Color(0xff3DB64E),
  //       secondary: Colors.blue,
  //       tertiary: Color(0xff8A898E),
  //       surface: Colors.white,
  //       onBackground: Color(0xffE6E6E8)),
  // );
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFFD36221),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xfff2f2f2),
    cardColor: Colors.white,
    brightness: Brightness.light,
    dividerTheme: const DividerThemeData(
      color: Colors.black,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xFFD36221),
      selectionColor: const Color(0xFFD36221).withOpacity(0.5),
      selectionHandleColor: const Color(0xFFD36221),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFD36221),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFD36221),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 25,
        letterSpacing: 2,
      ),
      displayMedium: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 22,
        letterSpacing: 2,
      ),
      displaySmall: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 20,
        letterSpacing: 2,
      ),
      headlineMedium: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 18,
        letterSpacing: 2,
      ),
      headlineSmall: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 16,
        letterSpacing: 2,
        height: 1.5,
      ),
      titleLarge: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 14,
        letterSpacing: 2,
        height: 1.5,
      ),
      labelLarge: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 16,
        letterSpacing: 2,
      ),
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        color: const Color(0xFFD36221),
        fontSize: 25,
        letterSpacing: 2,
      ),
    ),
    colorScheme: const ColorScheme(
        background: Color(0xffffffff),
        brightness: Brightness.light,
        error: Colors.red,
        onError: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        primary: Color(0xFFD36221),
        secondary: Color(0xFFFF8902),
        tertiary: Color(0xff8A898E),
        surface: Colors.white,
        onBackground: Color(0xffE6E6E8)),
  );
}
