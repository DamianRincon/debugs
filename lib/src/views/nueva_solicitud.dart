import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewSolicitud extends StatefulWidget {
  NewSolicitud({Key key}) : super(key: key);

  @override
  _NewSolicitudState createState() => _NewSolicitudState();
}

class _NewSolicitudState extends State<NewSolicitud> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        
      )
    );
  }
}