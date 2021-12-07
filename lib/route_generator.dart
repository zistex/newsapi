import 'package:flutter/material.dart';
import 'package:news/pages/news.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;
    switch (settings.name) {
      case '/News':
        return MaterialPageRoute(builder: (_) => News());
      //case '/Detail':
        //return MaterialPageRoute(builder: (_) => GoalHow());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SizedBox(height: 0)));
    }
  }
}
