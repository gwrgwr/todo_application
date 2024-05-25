import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.white,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle( // Textos que tiverem o style de bodyMedium pegarão esse estilo.
          color: Colors.grey,
          fontSize: 18,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          color: Color(0xffDAD4D3),
          fontSize: 20,
        ),
      ),
      textButtonTheme: const TextButtonThemeData( // Botão que tenha um texto
        style: ButtonStyle(

        )
      ),
      iconButtonTheme: const IconButtonThemeData( // Botão que tenha um ícone
        style: ButtonStyle(

        )
      ),
    );
  }
}
