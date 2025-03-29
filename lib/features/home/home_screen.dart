import 'package:ejary/features/properties/presentation/all_properties/all_properties_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AllPropertiesScreen(
      key: ValueKey(
          DateTime.now().toString()
      ),
    );
  }
}
