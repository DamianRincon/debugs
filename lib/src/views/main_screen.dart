import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ThemeData theme;
  List<Item> items = [
    Item("assets/prospectos.png","Prospectos"),
    Item("assets/agenda.png","Agenda"),
    Item("assets/capacitación.png","Capacitación"),
    Item("assets/citas.png","Citas"),
    Item("assets/clientes.png","Clientes"),
    Item("assets/contactos.png","Contactos"),
    Item("assets/monitores.png","Monitores"),
    Item("assets/solicitudes.png","Solicitudes")
  ];

  @override
  void initState() {
    theme = lightTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;

    return Theme(
      data: theme,
      child: Scaffold(
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
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage("assets/funko.jpg")
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Damián", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("damianrincondrc")
                          ]
                        )
                      ]
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white), 
                      onPressed: ()=>
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          builder: (c){
                            return Container(
                              height: 120,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text("Modo Oscuro"),
                                    onTap: (){
                                      setState(() {
                                        theme = darkTheme;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text("Modo Claro"),
                                    onTap: (){
                                      setState(() {
                                        theme = lightTheme;
                                      });
                                      Navigator.pop(context);
                                    },
                                  )
                                ]
                              ),
                            );
                          }
                        )
                    )
                  ]
                )
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: List.generate(items.length, (index){
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(items[index].url, width: 100, color: theme.appBarTheme.actionsIconTheme.color),
                            Text(
                              items[index].name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ) 
              )
            ]
          )
        ],
      )
    ),
    );
  }
}

class Item {
  String url;
  String name;
  Item(this.url, this.name);
}

final Color primary = Colors.blue;
final Color black = Colors.black;
final Color secundaryColor = Colors.blue;
final Color blugrey = Colors.blueGrey[900];
final Color white = Colors.white;
final Color backgroundBlack = Color(0xFF121212);


ThemeData darkTheme = ThemeData(
  fontFamily: 'ProductSans',
  appBarTheme: AppBarTheme(
    color: backgroundBlack,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
  ),
  scaffoldBackgroundColor: backgroundBlack,
  bottomAppBarColor: Color(0xFF09090C),
  brightness: Brightness.dark,
  primaryColor: primary,
  backgroundColor: backgroundBlack,
  accentColor: secundaryColor,
  dividerColor: Colors.white54,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(secundaryColor),
  primaryColorBrightness: ThemeData.estimateBrightnessForColor(backgroundBlack),
  primarySwatch: Colors.grey,
  accentIconTheme: IconThemeData(color: Colors.blueGrey[900]),
  
);

ThemeData lightTheme = ThemeData(
  fontFamily: 'ProductSans',    
  appBarTheme: AppBarTheme(
    color: white,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.blueGrey[900]),
    actionsIconTheme: IconThemeData(color: Colors.blueGrey[900]),
    elevation: 0
  ),
  scaffoldBackgroundColor: white,
  bottomAppBarColor: Colors.white,
  backgroundColor: white,
  accentColor: secundaryColor,
  dividerColor: Colors.white54,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(secundaryColor),
  primaryColorBrightness: ThemeData.estimateBrightnessForColor(white),
  brightness: Brightness.light,
  primaryColor: primary,
  primarySwatch: Colors.grey,
  accentIconTheme: IconThemeData(color: Colors.white),
);