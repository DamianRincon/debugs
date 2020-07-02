import 'dart:io';
import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/utils.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactos extends StatefulWidget {
  Contactos({Key key}) : super(key: key);

  @override
  _ContactosState createState() => _ContactosState();
}



class _ContactosState extends State<Contactos> {


  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contactos"), 
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(right: -150, child: ClipCustom()),
            Positioned(bottom: -250, left: -50, child: ClipCustom()),
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Card(
                    shadowColor: Colors.lightBlue,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, "/detalle_contacto", arguments:"Abraham Castillo"),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Abraham Castillo",
                                style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            SizedBox(height: 10),
                            Text("Calificación Con reservas 1.0"),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset("assets/whatsapp.png"),
                                  onPressed: () => launchWhatsApp(
                                    phone: "+529611733525",
                                    message: "Hola"
                                  )
                                ),
                                IconButton(
                                  icon: Icon(Icons.call, color: Colors.blue, size: 30),
                                  onPressed: () => launchPhone("9611733525")
                                ),
                                IconButton(
                                  icon: Icon(Icons.date_range, color: Colors.orange, size: 30),
                                  onPressed: () => Navigator.pushNamed(context, "/new_cita")
                                )
                              ]
                            )
                          ]
                        )
                      ),
                    )
                  ),
                  Card(
                    shadowColor: Colors.lightBlue,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, "/detalle_contacto", arguments: "Damián Rincón"),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Damián Rincón C.",
                                style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            SizedBox(height: 10),
                            Text("Calificación Con reservas 6.2"),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset("assets/whatsapp.png"),
                                  onPressed: () => launchWhatsApp(
                                    phone: "+529611733525",
                                    message: "Hola"
                                  )
                                ),
                                IconButton(
                                  icon: Icon(Icons.call, color: Colors.blue, size: 30),
                                  onPressed: () => launchPhone("9611733525")
                                ),
                                IconButton(
                                  icon: Icon(Icons.date_range, color: Colors.orange, size: 30),
                                  onPressed: () => Navigator.pushNamed(context, "/new_cita")
                                )
                              ]
                            )
                          ]
                        )
                      ),
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}
