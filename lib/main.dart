import 'package:currency_app/di/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  setupDependencyInjection();
  runApp( MyApp());
}