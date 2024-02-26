//Definicion de los Temas de estilo de la app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  // Constante de color primaria
  static const primaryColor = Color.fromARGB(255, 233, 63, 21);
  // Constante de color secundario
  static const secondaryColor = Color.fromARGB(255, 217, 248, 108);
  // Constante de color de fondo
  static const backColor = Color.fromARGB(218, 137, 208, 249);
  // Constante de tema
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      titleTextStyle: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 28.5,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(
      color: primaryColor,
      size: 30.0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          primaryColor,
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.pacifico(
            fontSize: 25.0,
          )
        ),
      ) 
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