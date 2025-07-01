import 'package:flutter/material.dart';
import 'package:myproject/core/pages/not_found_screen.dart';
import 'package:myproject/core/pages/splash_screen.dart';
import 'package:myproject/features/chat/presentation/pages/chat_screen.dart';
import 'package:myproject/features/home/presentation/pages/home_screen.dart';
import 'package:myproject/features/settings/presentation/pages/settings_screen.dart';
import 'package:myproject/features/worship/presentation/pages/worship_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String setting = '/settings';
  static const String worship = '/worship';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case chat:
        return MaterialPageRoute(builder: (context) => const ChatScreen());
      case setting:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case worship:
        return MaterialPageRoute(builder: (context) => const WorshipScreen());

      // Default page jika halaman tidak ditemukan
      default:
        return _notFoundPage;
    }
  }

  static MaterialPageRoute get _invalidArgumentPage => MaterialPageRoute(
    builder:
        (context) => const Scaffold(
          body: Center(child: Text("Data yang diterima tidak valid")),
        ),
  );

  static MaterialPageRoute get _notFoundPage =>
      MaterialPageRoute(builder: (context) => NotFoundScreen());
}
