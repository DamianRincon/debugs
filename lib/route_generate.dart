import 'package:Debug/src/views/citas.dart';
import 'package:flutter/material.dart';

import 'src/views/login.dart';
import 'src/views/agenda.dart';
import 'src/views/contactos.dart';
import 'src/views/solicitud.dart';
import 'src/views/prospectos.dart';
import 'src/views/nueva_cita.dart';
import 'src/views/main_screen.dart';
import 'src/views/nuevo_prospecto.dart';
import 'src/views/nueva_solicitud.dart';

class RouteGenerate {
  static Route<dynamic> initialize(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/login': return MaterialPageRoute(builder: (c) => Login(screenHeight: MediaQuery.of(c).size.height));
      case '/home': return MaterialPageRoute(builder: (c) => MainScreen());
      case '/prospect' : return MaterialPageRoute(builder: (c) => ProspectScreen());
      case '/new_prospect' : return MaterialPageRoute(builder: (c) => NuevoProstecto());
      case '/agenda' : return MaterialPageRoute(builder: (c) => Agenda());
      case '/citas' : return MaterialPageRoute(builder: (c) => Citas());
      case '/new_cita' : return MaterialPageRoute(builder: (c) => NuevaCita());
      case '/solicitudes' : return MaterialPageRoute(builder: (c) => Solicitud());
      case '/new_solicitud' : return MaterialPageRoute(builder: (c) => NewSolicitud());
      case '/contactos' : return MaterialPageRoute(builder: (c) => Contactos());
    }
  }
}