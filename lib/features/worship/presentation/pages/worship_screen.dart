import 'package:flutter/material.dart';
import 'package:myproject/common/widgets/base_screen.dart';

class WorshipScreen extends StatelessWidget {
  const WorshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 2,
      child: Center(child: Text("Worship Screen")),
    );
  }
}
