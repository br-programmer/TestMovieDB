import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get theme => ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: const Color(0XFFAF3A22),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      );
}
