import 'package:flutter/material.dart';

class DefaultTheme {
  final _primarySwatch = const MaterialColor(
    0xFFFF5300,
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFFF5300),
      600: Color(0xFFE65100),
      700: Color(0xFFD84315),
      800: Color(0xFFBF360C),
      900: Color(0xFF3E2723),
    },
  );

  ThemeData buildThemeData() {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _primarySwatch,
      backgroundColor: Colors.black,
      brightness: Brightness.light,
    ));
  }
}
