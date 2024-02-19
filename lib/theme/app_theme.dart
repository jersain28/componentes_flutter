//Definicion de los Temas de estilo de la app
import 'package:flutter/material.dart';

class AppTheme{
  // Constante de color primaria
  static const primaryColor = Colors.red;
  // Constante de color de fondo
  static const backColor = Color.fromARGB(218, 116, 197, 245);
  // Constante de tema
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: const AppBarTheme(
    color: primaryColor,
    ));
}