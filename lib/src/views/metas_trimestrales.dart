import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetasTrimestrales extends StatefulWidget {
  MetasTrimestrales({Key key}) : super(key: key);

  @override
  _MetasTrimestralesState createState() => _MetasTrimestralesState();
}

class _MetasTrimestralesState extends State<MetasTrimestrales> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;

  setChange(bool v){
    setState(() {
      check1 = v;
      check2 = v;
      check3 = v;
      check4 = v;
      check5 = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Metas trimestrales")
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text(
                  "Aplicar estacionario",
                  style: TextStyle(
                    fontSize: 18
                  )
                ),
                value: check1,
                onChanged: setChange
              ),

              CheckboxListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "1T",
                      style: TextStyle(
                        fontSize: 18
                      )
                    )
                  ],
                ),
                value: check2,
                onChanged: (v){}
              ),
              CheckboxListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "2T",
                      style: TextStyle(
                        fontSize: 18
                      )
                    )
                  ],
                ),
                value: check3,
                onChanged: (v){}
              ),
              CheckboxListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "3T",
                      style: TextStyle(
                        fontSize: 18
                      )
                    )
                  ],
                ),
                value: check4,
                onChanged: (v){}
              ),
              CheckboxListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "4T",
                      style: TextStyle(
                        fontSize: 18
                      )
                    )
                  ],
                ),
                value: check5,
                onChanged: (v){}
              ),
            ]
          )
        )
      )
    );
  }
}