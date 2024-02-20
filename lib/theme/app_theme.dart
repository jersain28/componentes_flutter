//Definicion de los Temas de estilo de la app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  // Constante de color primaria
  static const primaryColor = Color.fromARGB(255, 236, 85, 74);
  // Constante de color secundario
  static const secondaryColor = Colors.black;
  // Constante de color de fondo
  static const backColor = Color.fromARGB(218, 137, 208, 249);
  // Constante de tema
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: const AppBarTheme(
    color: primaryColor,
    ),
    textTheme: TextTheme(
      // Titulos muy grandes
      headlineLarge: GoogleFonts.acme(
        color: primaryColor,
        fontSize: 26.5,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: primaryColor,
        decorationStyle: TextDecorationStyle.wavy,
        decorationThickness: 2.0,
      ),
      // Estilo para texto muy pequeño
      bodySmall: GoogleFonts.montserrat(
        color: secondaryColor,
        fontSize: 15.0,
      ),
    ),
  );
}