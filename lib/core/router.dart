import 'package:flutter/material.dart';
import 'package:musify/view/home_section/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
    }
  }
}