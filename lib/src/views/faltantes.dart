import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Faltantes extends StatefulWidget {
  Faltantes({Key key}) : super(key: key);

  @override
  _FaltantesState createState() => _FaltantesState();
}

class _FaltantesState extends State<Faltantes> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    var size = MediaQuery.of(context).size;
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Faltantes y cumplimiento")
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                shadowColor: Colors.lightBlue,
                child: Container(
                  height: 100,
                  width: size.width,
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Meta anual",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$2,000,000.00",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Center(
                          child: Icon(Icons.linear_scale, color: Colors.white),
                        ),
                      )
                    ]
                  )
                )
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                shadowColor: Colors.lightBlue,
                child: Container(
                  height: 100,
                  width: size.width,
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Negocios pagados",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "26",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Center(
                          child: Icon(Icons.store, color: Colors.white),
                        ),
                      )
                    ]
                  )
                )
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                shadowColor: Colors.lightBlue,
                child: Container(
                  height: 150,
                  width: size.width,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("% de avance"),
                          Text("Faltantes")
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("5%"),
                          Text("\$1,375,300.00")
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("3%"),
                          Text("\$2,018,729.00")
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("8%"),
                          Text("\$23.00")
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("6%"),
                          Text("\$34.00")
                        ],
                      ),
                    ]
                  )
                )
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)
                ),
                shadowColor: Colors.lightBlue,
                child: Container(
                  height: 100,
                  width: size.width,
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Semanas faltantes del año",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "26",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Center(
                          child: Icon(Icons.calendar_today, color: Colors.white),
                        ),
                      )
                    ]
                  )
                )
              ),
            ]
          )
        )
      )
    );
  }
}