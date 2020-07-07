import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app.dart';
import '../widgets/clip.dart';

class Productos extends StatefulWidget {
  Productos({Key key}) : super(key: key);

  @override
  _ProductosState createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {

  List<Item> items = [
    Item("assets/icons/introduccion.png","Introducción","/lorem"),
    Item("assets/icons/produccion.png","Protección","/lorem"),
    Item("assets/icons/ahorro.png","Ahorro","/lorem"),
    Item("assets/icons/educacion.png","Educación","/lorem"),
    Item("assets/icons/retiro.png","Retiro","/lorem"),
    Item("assets/icons/proteccion-y-ahorro.png","Protección y ahorro","/lorem"),
    Item("assets/icons/resumen.png","Resumén","/lorem"),
    Item("assets/icons/cotizacion.png","Cotización vida individual","/lorem")
  ];

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
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
            Container(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.25,
                children: List.generate(items.length, (index){
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      shadowColor: Colors.lightBlue[300],
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(context, items[index].page),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(items[index].url, width: 80, color: app.theme.appBarTheme.actionsIconTheme.color),
                            Text(
                              items[index].name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )
                            )
                          ]
                        )
                      )
                    )
                  );
                })
              )
            )
          ]
        ),
      )
    );
  }
}

class Item {
  String url;
  String name;
  String page;
  Item(this.url, this.name, this.page);
}