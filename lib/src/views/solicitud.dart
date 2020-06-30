import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
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
          title: Text("Solicitudes"),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, right: 10),
              child: Text("Hoy: 30/06/2020", style: TextStyle(fontWeight: FontWeight.bold))
            )
          ]
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
            SingleChildScrollView(
              padding: EdgeInsets.only(
                top:10,
                right: 16,
                left: 16
              ),
              child: Column(
                children: <Widget>[
                  Card(
                    shadowColor: Colors.lightBlue,
                    elevation: 5,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          height: 140,
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
                              SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "2020/06/30",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                  Text(
                                    "03:15 PM",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ]
                              )
                            ]
                          )
                        ),
                        Positioned(
                          right: 50,
                          top: 0,
                          child: IconButton(
                            icon: Icon(Icons.email, color: Colors.lightBlue, size: 80),
                            onPressed: (){}
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()=> Navigator.pushNamed(context, '/new_solicitud'),
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        )
      )
    );
  }
}