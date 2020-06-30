import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            IconButton(
              icon: Icon(Icons.search), 
              onPressed: (){}
            )
          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){}, 
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Abraham Castillo", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Calificación Con reservas 1.0"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset("assets/whatsapp.png"),
                            onPressed: (){}
                          ),
                          IconButton(
                            icon: Icon(Icons.call, color: Colors.blue),
                            onPressed: (){}
                          ),
                          
                          IconButton(
                            icon: Icon(Icons.date_range, color: Colors.orange),
                            onPressed: (){}
                          )
                        ]
                      )
                    ],
                  ),
                )
              )
            ]
          )
        )
      )
    );
  }
}