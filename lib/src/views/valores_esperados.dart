import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValoresEsperados extends StatefulWidget {
  ValoresEsperados({Key key}) : super(key: key);

  @override
  _ValoresEsperadosState createState() => _ValoresEsperadosState();
}

class _ValoresEsperadosState extends State<ValoresEsperados> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Valores Esperados")
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              bottom: -250,
              left: -50,
              child: ClipCustom()
            ),
            DataTable(
              columns:[
                DataColumn(
                  label: Text(""),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Valores\nesperados"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Eficiencia\nesperada"),
                  numeric: false,
                )
              ],
              rows:[
                DataRow(
                  cells: [
                    DataCell(
                      Text("Prospectos"),
                    ),
                    DataCell(
                      Text("30"),
                    ),
                    DataCell(
                      Text(""),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Llamadas\nrealizadas"),
                    ),
                    DataCell(
                      Text("30"),
                    ),
                    DataCell(
                      Text("100%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\nagendadas"),
                    ),
                    DataCell(
                      Text("11"),
                    ),
                    DataCell(
                      Text("35%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\niniciales"),
                    ),
                    DataCell(
                      Text("8"),
                    ),
                    DataCell(
                      Text("80%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\nde cierre"),
                    ),
                    DataCell(
                      Text("6"),
                    ),
                    DataCell(
                      Text("70%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Solicitudes"),
                    ),
                    DataCell(
                      Text("2"),
                    ),
                    DataCell(
                      Text("40%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Negocios"),
                    ),
                    DataCell(
                      Text("1"),
                    ),
                    DataCell(
                      Text("70%"),
                    )
                  ]
                )
              ]
            )
          ]
        )
      )
    );
  }
}