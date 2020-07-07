import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultadosSemanales extends StatefulWidget {
  ResultadosSemanales({Key key}) : super(key: key);

  @override
  _ResultadosSemanalesState createState() => _ResultadosSemanalesState();
}

class _ResultadosSemanalesState extends State<ResultadosSemanales> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resultados semanales")
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
                      Text("31"),
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
                      Text("97%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\nagendadas"),
                    ),
                    DataCell(
                      Text("12"),
                    ),
                    DataCell(
                      Text("40%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\niniciales"),
                    ),
                    DataCell(
                      Text("10"),
                    ),
                    DataCell(
                      Text("83%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\nde cierre"),
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
                      Text("Solicitudes"),
                    ),
                    DataCell(
                      Text("2"),
                    ),
                    DataCell(
                      Text("25%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Negocios"),
                    ),
                    DataCell(
                      Text("2"),
                    ),
                    DataCell(
                      Text("100%"),
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