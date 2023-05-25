import 'package:currency_app/di/injectable.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
