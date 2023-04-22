import 'package:currency_app/pages/main_page/main_page.dart';
import 'package:currency_app/theme/default_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency App',
      theme: DefaultTheme().buildThemeData(),
      home: const MainPage(title: 'Currency App'),
    );
  }
}
