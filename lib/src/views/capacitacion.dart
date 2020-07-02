import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/clip.dart';

class Capacitacion extends StatefulWidget {
  Capacitacion({Key key}) : super(key: key);

  @override
  _CapacitacionState createState() => _CapacitacionState();
}

class _CapacitacionState extends State<Capacitacion> {

  List<Item> items = [
    Item("assets/icons/cobertura-de-seguro.png","Cobertura",""),
    Item("assets/icons/productos.png","Productos","/productos"),
    Item("assets/icons/requisitos-de-seguridad.png","Seguridad",""),
    Item("assets/icons/ciclo-de-venta.png","Ciclo de ventas","")
  ];

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Capacitación"),
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
                                fontSize: 22,
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
        )
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