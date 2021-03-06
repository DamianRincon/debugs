import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Citas extends StatefulWidget {
  Citas({Key key}) : super(key: key);

  @override
  _CitasState createState() => _CitasState();
}

class _CitasState extends State<Citas> {

  _showMessage(){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
      builder: (c){
        return Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text("¿Desea inciar la grabación?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("No por ahora")),
                  FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Sí"))         
                ]
              )
            ]
          )
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Citas"),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, right: 10),
              child: Text("Hoy: 30/06/2020", style: TextStyle(fontWeight: FontWeight.bold)),
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
                        Positioned(
                          right: 20,
                          top: 10,
                          child: IconButton(
                            icon: Icon(Icons.mic, color: Colors.blue, size: 50),
                            onPressed: ()=> _showMessage()
                          )
                        ),
                        Positioned(
                          right: 15,
                          bottom: 15,
                          child: Text("04:30 PM", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 15),
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.account_circle),
                                  SizedBox(width: 10),
                                  Text("Marco Moreno")    
                                ]
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.group),
                                  SizedBox(width: 10),
                                  Text("Cita inicial")    
                                ]
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, bottom: 15),
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10),
                                  Text("Londres")    
                                ]
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: ()=> _showMessage(),
                                  child: Text("INICIAR", style: TextStyle(color: Colors.blue))
                                ),
                                FlatButton(
                                  onPressed: (){}, 
                                  child: Text("FINALIZAR", style: TextStyle(color: Colors.blue))
                                )
                              ]
                            )
                          ]
                        )
                      ],
                    )
                  ),

                  Card(
                    shadowColor: Colors.lightBlue,
                    elevation: 5,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 20,
                          top: 10,
                          child: IconButton(
                            icon: Icon(Icons.mic, color: Colors.blue, size: 50),
                            onPressed: ()=> _showMessage()
                          )
                        ),
                        Positioned(
                          right: 15,
                          bottom: 15,
                          child: Text("06:45 PM", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 15),
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.account_circle),
                                  SizedBox(width: 10),
                                  Text("Damián Rincón")    
                                ]
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.group),
                                  SizedBox(width: 10),
                                  Text("Cierre")    
                                ]
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, bottom: 15),
                              padding: EdgeInsets.only(bottom: 5, top: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10),
                                  Text("Guadalajara centro")    
                                ]
                              )
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: ()=> _showMessage(),
                                  child: Text("INICIAR", style: TextStyle(color: Colors.blue))
                                ),
                                FlatButton(
                                  onPressed: (){}, 
                                  child: Text("FINALIZAR", style: TextStyle(color: Colors.blue))
                                )
                              ]
                            )
                          ]
                        )
                      ],
                    )
                  )

                ]
              )
            )
          ],
        )
      )
    );
  }
}