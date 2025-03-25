import 'package:ejary/ejary_app.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart' show init;

void main() async {
  await init();
  runApp(const EjaryApp());
}
