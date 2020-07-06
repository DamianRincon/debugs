import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetasAnuales extends StatefulWidget {
  MetasAnuales({Key key}) : super(key: key);

  @override
  _MetasAnualesState createState() => _MetasAnualesState();
}

class _MetasAnualesState extends State<MetasAnuales> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    var size = MediaQuery.of(context).size;
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Metas anuales"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
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
                            "Producción",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$1,450,000.00",
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
                            child: Icon(Icons.store, color: Colors.white, size: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "36",
                            style: TextStyle(
                              fontSize: 22
                            )
                          ),
                          Text(
                            "Negocios pagados"
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
                            child: Icon(Icons.store, color: Colors.white, size: 30),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "25",
                            style: TextStyle(
                              fontSize: 22
                            )
                          ),
                          Text(
                            "Negocios solicitados"
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
                            "Solicitación",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.blue
                            )
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$2,071,249.00",
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
              )
            ]
          )
        )
      )
    );
  }
}