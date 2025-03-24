import 'package:ejary/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EjaryApp extends StatelessWidget {
  const EjaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(body: Center(child: Text('Ejary App'))),
    );
  }
}
