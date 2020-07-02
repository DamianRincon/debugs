import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Item> items = [
    Item("assets/prospectos.png","Prospectos","/prospect"),
    Item("assets/contactos.png","Contactos","/contactos"),
    Item("assets/agenda.png","Agenda","/agenda"),
    Item("assets/citas.png","Citas","/citas"),
    Item("assets/solicitudes.png","Solicitudes","/solicitudes"),
    Item("assets/clientes.png","Clientes","/clientes"), 
    Item("assets/monitores.png","Monitoreo","/monitoreo"),
    Item("assets/capacitación.png","Capacitación","/capacitacion")
  ];

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset("assets/icons/velocimetro.png", width: 35, color: app.theme.iconTheme.color),
            onPressed: ()=> Navigator.pushNamed(context, "/velocimetro")
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Damián", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("damianrincondrc", style: TextStyle(fontSize: 13))
            ]
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: ()=> showModalBottomSheet(
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
                      children: <Widget>[
                        ListTile(
                          title: Text("Modo Oscuro"),
                          onTap: (){
                            Provider.of<App>(c, listen: false).setTheme(true);
                            Navigator.pop(context);
                          }
                        ),
                        ListTile(
                          title: Text("Modo Claro"),
                          onTap: (){
                            Provider.of<App>(c, listen: false).setTheme(false);
                            Navigator.pop(context);
                          }
                        )
                      ]
                    )
                  );
                }
              )
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