import 'dart:io';

import 'package:ejary/ejary_app.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'core/di/di.dart' show init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  if (Platform.isWindows) {
    setWindowMinSize(const Size(1440, 1024)); // Minimum width and height
  }

  runApp(const EjaryApp());
}
