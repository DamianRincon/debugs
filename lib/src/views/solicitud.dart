import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Solicitud extends StatefulWidget {
  Solicitud({Key key}) : super(key: key);

  @override
  _SolicitudState createState() => _SolicitudState();
}

class _SolicitudState extends State<Solicitud> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Solicitudes")
        ),
        body: Center(
          child: Text("Sin solicitudes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.grey[400])),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()=> Navigator.pushNamed(context, '/new_solicitud'),
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        ),
      )
    );
  }
}