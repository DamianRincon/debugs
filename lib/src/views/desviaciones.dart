import 'package:Debug/src/providers/app.dart';
import 'package:Debug/src/widgets/clip.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Desviaciones extends StatefulWidget {
  Desviaciones({Key key}) : super(key: key);

  @override
  _DesviacionesState createState() => _DesviacionesState();
}

class _DesviacionesState extends State<Desviaciones> {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Desviaciones"),
            bottom: TabBar(
              labelStyle: TextStyle( //up to your taste
                fontWeight: FontWeight.w700
              ),
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: Color(0xff1a73e8), //Google's sweet blue
              unselectedLabelColor: Color(0xff5f6368), //niceish grey
              isScrollable: false, //up to your taste
              indicator: MD2Indicator( //it begins here
                indicatorHeight: 3,
                indicatorColor: Color(0xff1a73e8),
                indicatorSize: MD2IndicatorSize.normal //3 different modes tiny-normal-full
              ),
              tabs: <Widget>[
                Tab(
                  text: "Eficiencia",
                ),
                Tab(
                  text: "Acumulado",
                )
              ]
            )
          ),
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                bottom: -250,
                left: -50,
                child: ClipCustom()
              ),
              TabBarView(
                children: <Widget>[
                  Container(
                    child: DataTable(
                      columnSpacing: 15,
                      columns:[
                        DataColumn(
                          label: Text(""),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Eficiencias\nobtenidas"),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Eficiencia\nesperada"),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Desviación"),
                          numeric: false,
                        )
                      ],
                      rows:[
                        DataRow(
                          cells: [
                            DataCell(
                              Text("Llamadas\nrealizadas"),
                            ),
                            DataCell(
                              Text("97%"),
                            ),
                            DataCell(
                              Text("100%", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("-3%", style: TextStyle(color: Colors.red)),
                            )
                          ]
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("Citas\nagendadas"),
                            ),
                            DataCell(
                              Text("40%"),
                            ),
                            DataCell(
                              Text("35%", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("5%"),
                            )
                          ]
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("Citas\niniciales"),
                            ),
                            DataCell(
                              Text("83%"),
                            ),
                            DataCell(
                              Text("80%", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("3%"),
                            )
                          ]
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("Citas\nde cierre"),
                            ),
                            DataCell(
                              Text("80%"),
                            ),
                            DataCell(
                              Text("70%", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("10%"),
                            )
                          ]
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("Solicitudes"),
                            ),
                            DataCell(
                              Text("25%"),
                            ),
                            DataCell(
                              Text("40%", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("-15%", style: TextStyle(color: Colors.red)),
                            )
                          ]
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("Negocios"),
                            ),
                            DataCell(
                              Text("100%"),
                            ),
                            DataCell(
                              Text("70%", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("30%"),
                            )
                          ]
                        )
                      ]
                    )
                  ),
                  Container(
                    child: DataTable(
                      columnSpacing: 15,
                      columns:[
                        DataColumn(
                          label: Text(""),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Acomulado\nsemanal"),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Valores\nesperados"),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("% de \ncumplimiento"),
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
                              Text("30", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("103%"),
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
                              Text("30", style: TextStyle(color: Colors.blue)),
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
                              Text("12"),
                            ),
                            DataCell(
                              Text("11", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("114%"),
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
                              Text("8", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("119%"),
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
                              Text("6", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("136%"),
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
                              Text("2", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("85%", style: TextStyle(color: Colors.red)),
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
                              Text("1", style: TextStyle(color: Colors.blue)),
                            ),
                            DataCell(
                              Text("200%"),
                            )
                          ]
                        )
                      ]
                    )
                  )
                ]
              )
            ]
          ),
        )
      ),
      /*child: Scaffold(
        appBar: AppBar(
          title: Text("Desviaciones")
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
              columnSpacing: 15,
              columns:[
                DataColumn(
                  label: Text(""),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Acomulado\nsemanal"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Valores\nesperados"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("% de \ncumplimiento"),
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
                      Text(""),
                    ),
                    DataCell(
                      Text(""),
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
                      Text("97%"),
                    ),
                    DataCell(
                      Text("100%", style: TextStyle(color: Colors.blue)),
                    ),
                    DataCell(
                      Text("-3%", style: TextStyle(color: Colors.red)),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\nagendadas"),
                    ),
                    DataCell(
                      Text("40%"),
                    ),
                    DataCell(
                      Text("35%", style: TextStyle(color: Colors.blue)),
                    ),
                    DataCell(
                      Text("5%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\niniciales"),
                    ),
                    DataCell(
                      Text("83%"),
                    ),
                    DataCell(
                      Text("80%", style: TextStyle(color: Colors.blue)),
                    ),
                    DataCell(
                      Text("3%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Citas\nde cierre"),
                    ),
                    DataCell(
                      Text("80%"),
                    ),
                    DataCell(
                      Text("70%", style: TextStyle(color: Colors.blue)),
                    ),
                    DataCell(
                      Text("10%"),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Solicitudes"),
                    ),
                    DataCell(
                      Text("25%"),
                    ),
                    DataCell(
                      Text("40%", style: TextStyle(color: Colors.blue)),
                    ),
                    DataCell(
                      Text("-15%", style: TextStyle(color: Colors.red)),
                    )
                  ]
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text("Negocios"),
                    ),
                    DataCell(
                      Text("100%"),
                    ),
                    DataCell(
                      Text("70%", style: TextStyle(color: Colors.blue)),
                    ),
                    DataCell(
                      Text("30%"),
                    )
                  ]
                )
              ]
            )
          ]
        )
      )*/
    );
  }
}