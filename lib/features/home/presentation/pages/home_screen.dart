import 'package:flutter/material.dart';
import 'package:myproject/common/widgets/base_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 0,
      child: Center(child: Text("Home Screen")),
    );
  }
}
