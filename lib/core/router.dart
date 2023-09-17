import 'package:flutter/material.dart';
import 'package:musify/view/home_section/home_screen.dart';
import 'package:musify/view/search_result_section/search_result_screen.dart';
import 'package:musify/view/search_section/search_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case 'SearchScreen':
        return MaterialPageRoute(
          builder: (context) =>  SearchScreen(),
        );
      case 'SearchResultScreen':
        return MaterialPageRoute(builder: (context) {
          SearchResultScreen screen =
              routeSettings.arguments as SearchResultScreen;
          return SearchResultScreen(
            query: screen.query,
          );
        });
      default:
        return MaterialPageRoute(
          builder: (_) => const SizedBox(),
        );
    }
  }
}
