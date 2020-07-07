import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:lorem_cutesum/lorem_cutesum.dart';
import 'package:provider/provider.dart';

class Lorem extends StatefulWidget {
  Lorem({Key key}) : super(key: key);

  @override
  _LoremState createState() => _LoremState();
}

class _LoremState extends State<Lorem> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return  Theme(
      data: app.theme,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(Cutesum.randomImageUrl()),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("1.- ${Cutesum.loremCutesum(words: 50)}"),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("2.- ${Cutesum.loremCutesum(words: 50)}"),
              )
            ]
          )
        )
      )
    );
  }
}