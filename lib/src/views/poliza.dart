import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../providers/app.dart';
import '../widgets/clip.dart';
import '../widgets/custom_field.dart';

class Poliza extends StatefulWidget {
  Poliza({Key key}) : super(key: key);

  @override
  _PolizaState createState() => _PolizaState();
}

class _PolizaState extends State<Poliza> {
  File _file;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _file = File(pickedFile.path);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    var size = MediaQuery.of(context).size;
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Poliza"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save), 
              onPressed: ()=> Toast.show("Guardado", context)
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: -150,
              child: ClipCustom()
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Prospecto:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: ["Juan Hernandes","Mariana Cardenas","Rodolfo Cancino","Hilda Maria Gomez"].map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: <Widget>[
                            Text(category)
                          ]
                        )
                      );
                    }).toList(),
                    onChanged: (newValue) {},
                    value: "Juan Hernandes",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      filled: true,
                      fillColor: app.theme.scaffoldBackgroundColor,
                    )
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Número de poliza:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Poliza",
                    borderRadius: 5,
                    type: TextInputType.number,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),
                  
                  Text(
                    "Nombre del contratante:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Contratante",
                    borderRadius: 5,
                    type: TextInputType.text,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),

                  Text(
                    "Nombre del asegurado:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Asegurado",
                    borderRadius: 5,
                    type: TextInputType.text,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),

                  Text(
                    "Inicio de la vigencia:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Vigencia",
                    borderRadius: 5,
                    type: TextInputType.datetime,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                    suffixIcon: Icon(Icons.calendar_today),
                  ),

                  Text(
                    "Prima pagada:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Prima pagada",
                    borderRadius: 5,
                    type: TextInputType.text,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),

                  Text(
                    "Prima anualizada:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Prima anualizada",
                    borderRadius: 5,
                    type: TextInputType.text,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),
                  Card(
                    child: Container(
                      height: 250,
                      width: size.width,
                      child: _file == null ? InkWell(
                        onTap: getImage,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera, size: 70, color: Colors.grey[600]),
                            Text("Tomar foto", style: TextStyle(fontSize: 30))
                          ]
                        ),
                      ) : Image.file(_file, fit: BoxFit.cover)
                    ),
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}