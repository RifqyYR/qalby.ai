import 'package:flutter/material.dart';
import 'package:myproject/core/pages/splash_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String settings = '/settings';
  static const String worship = '/worship';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

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

  static MaterialPageRoute get _notFoundPage => MaterialPageRoute(
    builder:
        (context) =>
            Scaffold(body: Center(child: Text("Halaman tidak ditemukan"))),
  );
}
