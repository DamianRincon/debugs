import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Clientes extends StatefulWidget {
  Clientes({Key key}) : super(key: key);

  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clientes'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
            )
          ]
        ),
        body: Stack(
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
          ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        ),
      )
    );
  }
}