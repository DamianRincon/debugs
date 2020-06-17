import 'package:flutter/material.dart';

import 'src/views/login.dart';
import 'src/views/main_screen.dart';
import 'src/views/prospectos.dart';
import 'src/views/nuevo_prospecto.dart';

class RouteGenerate {
  static Route<dynamic> initialize(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/login': return MaterialPageRoute(builder: (c) => Login(screenHeight: MediaQuery.of(c).size.height));
      case '/home': return MaterialPageRoute(builder: (c) => MainScreen());
      case '/prospect' : return MaterialPageRoute(builder: (c) => ProspectScreen());
      case '/new_prospect' : return MaterialPageRoute(builder: (c) => NuevoProstecto());
    }
  }
}