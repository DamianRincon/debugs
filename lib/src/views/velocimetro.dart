import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Velocimetro extends StatefulWidget {
  Velocimetro({Key key}) : super(key: key);

  @override
  _VelocimetroState createState() => _VelocimetroState();
}

class _VelocimetroState extends State<Velocimetro> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    var size = MediaQuery.of(context).size;

    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(),
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
            ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/metas_anuales"),
                    child: Container(
                      height: (size.height/4) -30,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 15),
                          Text("Metas anuales", style: TextStyle(fontSize: 22))
                        ]
                      )
                    ),
                  )
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/metas_semanales"),
                    child: Container(
                      height: (size.height/4) -30,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 15),
                          Text("Resultados semanales", style: TextStyle(fontSize: 22))
                        ]
                      )
                    ),
                  )
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/faltantes"),
                    child: Container(
                      height: (size.height/4) -30,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 15),
                          Text("Faltantes y\ncumplimiento", style: TextStyle(fontSize: 22))
                        ]
                      )
                    ),
                  )
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/metas_trimestrales"),
                    child: Container(
                      height: (size.height/4) -30,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 15),
                          Text("Metas trimestrales", style: TextStyle(fontSize: 22))
                        ]
                      )
                    ),
                  )
                )
              ]
            )
          ]
        ),
      )
    );
  }
}