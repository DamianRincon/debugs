import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:Debug/src/providers/app.dart';

class Historial extends StatefulWidget {
  final Object params;
  Historial({Key key, this.params}) : super(key: key);

  @override
  _HistorialState createState() => _HistorialState();
}

class _HistorialState extends State<Historial> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Actividades")
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: -150,
              child: ClipCustom()
            ),
            Positioned(
              bottom: -250,
              left: -50,
              child: ClipCustom()
            ),
            ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(child: Image.asset("assets/whatsapp.png", width: 24)),
                  title: Text(widget.params),
                  subtitle: Text("31/06/2020"),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.call, color: Colors.blue)),
                  title: Text(widget.params),
                  subtitle: Text("01/07/2020"),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.email, color: Colors.amber)),
                  title: Text(widget.params),
                  subtitle: Text("02/07/2020"),
                )
              ]
            )
          ]
        )
      )
    );
  }
}