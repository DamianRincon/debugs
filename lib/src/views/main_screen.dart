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
    Item("assets/contactos.png","Contactos",""),
    Item("assets/agenda.png","Agenda",""),
    Item("assets/citas.png","Citas",""),
    Item("assets/solicitudes.png","Solicitudes",""),
    Item("assets/clientes.png","Clientes",""), 
    Item("assets/monitores.png","Monitores",""),
    Item("assets/capacitación.png","Capacitación","")
  ];

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/funko.jpg")
            )
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
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
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