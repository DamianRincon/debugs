import 'package:flutter/material.dart';

import 'src/views/login.dart';
import 'src/views/main_screen.dart';

class RouteGenerate {
  static Route<dynamic> initialize(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/login': return MaterialPageRoute(builder: (context) => Login(screenHeight: MediaQuery.of(context).size.height));
      case '/home': return MaterialPageRoute(builder: (context) => MainScreen());

    }
  }
}