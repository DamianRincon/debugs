import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Debug/src/widgets/clip.dart';

import '../../src/widgets/custom_field.dart';

class NuevaCita extends StatefulWidget {
  NuevaCita({Key key}) : super(key: key);

  @override
  _NuevaCitaState createState() => _NuevaCitaState();
}

class _NuevaCitaState extends State<NuevaCita> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nueva Cita"),
          actions: [
            IconButton(
              icon: Icon(Icons.save), 
              onPressed: (){}
            )
          ]
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: -250,
              left: -50,
              child: ClipCustom()
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    "Tipo de cita:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: ["Cita inicial","Segunda cita","Cierre"].map((String category) {
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
                    value: "Cita inicial",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      filled: true,
                      fillColor: app.theme.scaffoldBackgroundColor,
                    )
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lugar de la cita:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Lugar",
                    borderRadius: 5,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),
                  Text(
                    "Fecha y hora:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          width: 150,
                          child: Center(child: Text("dd/mm/yyyy")),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1),
                          )
                        ),
                        Container(
                          height: 45,
                          width: 150,
                          child: Center(child: Text("00:00 AM/PM")),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1),
                          )
                        )
                      ]
                    )
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Recordatorio:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: ["Sin recodatorio","15 Min Antes","30 Min Antes", "45 Min Antes"].map((String category) {
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
                    value: "Sin recodatorio",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      filled: true,
                      fillColor: app.theme.scaffoldBackgroundColor,
                    )
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Comentario:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    dense: true,
                    filled: true,
                    label: "Comentario",
                    borderRadius: 5,
                    fillColor: app.theme.scaffoldBackgroundColor,
                    actionNode: TextInputAction.next,
                  ),
                ]
              )
            )
          ]
        )
      )
    );
  }
}