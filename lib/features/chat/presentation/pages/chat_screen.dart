import 'package:flutter/material.dart';
import 'package:myproject/common/widgets/base_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 1,
      child: Center(child: Text("Chat Screen")),
    );
  }
}
