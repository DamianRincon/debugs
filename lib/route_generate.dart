import 'package:Debug/src/views/capacitacion.dart';
import 'package:Debug/src/views/historial.dart';
import 'package:Debug/src/views/monitoreo.dart';
import 'package:Debug/src/views/poliza.dart';
import 'package:Debug/src/views/productos.dart';
import 'package:Debug/src/views/velocimetro.dart';
import 'package:flutter/material.dart';

import 'src/views/login.dart';
import 'src/views/agenda.dart';
import 'src/views/contactos.dart';
import 'src/views/solicitud.dart';
import 'src/views/prospectos.dart';
import 'src/views/nueva_cita.dart';
import 'src/views/main_screen.dart';
import 'src/views/citas.dart';
import 'src/views/clientes.dart';
import 'src/views/nuevo_prospecto.dart';
import 'src/views/nueva_solicitud.dart';
import 'src/views/contacto_detalle.dart';

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
      case '/detalle_contacto' : return MaterialPageRoute(builder: (c) => ContactoDetalle(params: args));
      case '/clientes' : return MaterialPageRoute(builder: (c) => Clientes());
      case '/historial' : return MaterialPageRoute(builder: (c) => Historial(params: args));
      case '/poliza' : return MaterialPageRoute(builder: (c) => Poliza());
      case '/capacitacion' : return MaterialPageRoute(builder: (c) => Capacitacion());
      case '/productos' : return MaterialPageRoute(builder: (c) => Productos());
      case '/monitoreo' : return MaterialPageRoute(builder: (c) => Monitoreo());
      case '/velocimetro' : return MaterialPageRoute(builder: (c) => Velocimetro());
      default: return null;
    }
  }
}