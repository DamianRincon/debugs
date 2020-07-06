import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetasSemanales extends StatefulWidget {
  MetasSemanales({Key key}) : super(key: key);

  @override
  _MetasSemanalesState createState() => _MetasSemanalesState();
}

class _MetasSemanalesState extends State<MetasSemanales> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    var size = MediaQuery.of(context).size;
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resultados semanales")
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    shadowColor: Colors.lightBlue,
                    child: Container(
                      height: 150,
                      width: (size.width/2) - 27,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Icon(Icons.settings, color: Colors.white, size: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$65,000.00",
                            style: TextStyle(
                              fontSize: 20
                            )
                          ),
                          Text(
                            "Producción"
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    ),
                    shadowColor: Colors.lightBlue,
                    child: Container(
                      height: 150,
                      width: (size.width/2) - 27,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Icon(Icons.settings, color: Colors.white, size: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$48,000.00",
                            style: TextStyle(
                              fontSize: 20
                            )
                          ),
                          Text(
                            "Produccion pagada"
                          )
                        ]
                      )
                    )
                  )
                ]
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
                            "Prima promedio anualizada",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$32,500.00",
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
                            "Prima promedio pagada",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$24,000.00",
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
              Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  shadowColor: Colors.lightBlue,
                  child: Container(
                    height: 100,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          "Polizas",
                          style: TextStyle(
                            fontSize: 20
                          )
                        ),
                        SizedBox(height: 10),
                        Text(
                          "2",
                          style: TextStyle(
                            fontSize: 25
                          )
                        )
                      ]
                    )
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}