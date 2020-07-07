import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app.dart';

class Monitoreo extends StatefulWidget {
  Monitoreo({Key key}) : super(key: key);

  @override
  _MonitoreoState createState() => _MonitoreoState();
}

class _MonitoreoState extends State<Monitoreo> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    var size = MediaQuery.of(context).size;
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Monitoreo")
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
            ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/valores_esperados"),
                    child: Container(
                      height: (size.height/3) -45,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue
                          ),
                          SizedBox(width: 15),
                          Text("Valores esperados", style: TextStyle(fontSize: 22))
                        ]
                      )
                    )
                  )
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/resultados_semanales"),
                    child: Container(
                      height: (size.height/3) -45,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue
                          ),
                          SizedBox(width: 15),
                          Text("Resultados semanales", style: TextStyle(fontSize: 22))
                        ]
                      )
                    )
                  )
                ),
                Card(
                  elevation: 2,
                  shadowColor: Colors.lightBlue,
                  child: InkWell(
                    onTap: ()=> Navigator.pushNamed(context, "/desviaciones"),
                    child: Container(
                      height: (size.height/3) -45,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 80,
                            color: Colors.blue
                          ),
                          SizedBox(width: 15),
                          Text("Desviaciones", style: TextStyle(fontSize: 22))
                        ]
                      )
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}