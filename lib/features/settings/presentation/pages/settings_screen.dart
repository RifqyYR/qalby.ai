import 'package:flutter/material.dart';
import 'package:myproject/common/widgets/base_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 3,
      child: Center(child: Text("Settings Screen")),
    );
  }
}
