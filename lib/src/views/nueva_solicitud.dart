import 'dart:io';

import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker    
import 'package:path/path.dart' as Path;

class NewSolicitud extends StatefulWidget {
  NewSolicitud({Key key}) : super(key: key);

  @override
  _NewSolicitudState createState() => _NewSolicitudState();
}

class _NewSolicitudState extends State<NewSolicitud> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
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
          title: Text("Nueva solicitud"),
           actions: [
            IconButton(
              icon: Icon(Icons.save), 
              onPressed: (){}
            )
          ]
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
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Prospecto", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  DropdownButtonFormField(
                    items: ["Mario Mendez","Juan Perez","Hilda Maria Gomez"].map((String category) {
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
                    value: "Hilda Maria Gomez",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      filled: true,
                      fillColor: app.theme.scaffoldBackgroundColor,
                    )
                  ),
                  SizedBox(height: 15),
                  Card(
                    child: _image == null ? InkWell(
                      onTap: getImage,
                      child: Container(
                        height: 250,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.camera, size: 70, color: Colors.grey[600]),
                            Text("Tomar foto", style: TextStyle(fontSize: 30))
                          ]
                        )
                      )
                    ) : Image.file(_image, height: 250, width: size.width,),
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