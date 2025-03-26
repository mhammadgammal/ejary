import 'package:ejary/core/widgets/app_bar/ejary_app_bar.dart';
import 'package:ejary/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EjaryAppBar(),
      body: HomeScreen(),
    );
  }
}
