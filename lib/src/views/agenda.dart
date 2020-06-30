import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:provider/provider.dart';

class Agenda extends StatefulWidget {
  Agenda({Key key}) : super(key: key);

  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map<DateTime, List> _events = {
    DateTime(2020, 6, 7): [
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 9): [
      {'name': 'Nueva Cita', 'isDone': false},
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 10): [
      {'name': 'Nueva Cita', 'isDone': false},
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 13): [
      {'name': 'Nueva Cita', 'isDone': false},
      {'name': 'Nueva Cita', 'isDone': false},
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 25): [
      {'name': 'Nueva Cita', 'isDone': false},
      {'name': 'Nueva Cita', 'isDone': false},
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 30): [
      {'name': 'Nueva Cita', 'isDone': false},
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  Widget _buildEventList(context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: Card(
            shadowColor: Colors.lightBlue,
            child: Container(
              height: 120,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Mar", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.blue)),
                        Text(_selectedDay.day.toString(), style: TextStyle(fontSize: 20)),
                      ]
                    )
                  ),
                  Container(
                    height: 130,
                    width: size.width -108,
                    color: Colors.lightBlue,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 10,
                          top: 10,
                          child: IconButton(
                            icon: Icon(Icons.mic, color: Colors.white, size: 35),
                            onPressed: ()=> showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)
                                )
                              ),
                              builder: (c){
                                return Container(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 10, left: 10),
                                        child: Text("¿Desea inciar la grabación?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("No por ahora")),
                                          FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Sí"))
                                          
                                        ],
                                      )
                                    ]
                                  )
                                );
                              }
                            )
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Text("Marco Moreno", style: TextStyle(fontSize: 22, color: Colors.white)),
                              Text("04:30 PM", style: TextStyle(fontSize: 18, color: Colors.white)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: ()=> showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)
                                        )
                                      ),
                                      builder: (c){
                                        return Container(
                                          height: 120,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(top: 10, left: 10),
                                                child: Text("¿Desea inciar la grabación?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("No por ahora")),
                                                  FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Sí"))
                                                  
                                                ],
                                              )
                                            ]
                                          )
                                        );
                                      }
                                    ), 
                                    child: Text("INICIAR", style: TextStyle(color: Colors.white))
                                  ),
                                  FlatButton(
                                    onPressed: (){}, 
                                    child: Text("FINALIZAR", style: TextStyle(color: Colors.white))
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
          /*child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          ),*/
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);
    return Theme(
      data: app.theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agenda"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pushNamed(context, "/new_cita"), 
          label: Text("Nuevo"),
          icon: Icon(Icons.add)
        ),
        body: Column(
          children: [
            Calendar(
              locale: "es",
              startOnMonday: true,
              weekDays: ["Lun", "Mar", "Mir", "Jue", "Vie", "Sab", "Dom"],
              events: _events,
              onRangeSelected: (range) => print("Range is ${range.from}, ${range.to}"),
              onDateSelected: (date) => _handleNewDate(date),
              isExpandable: true,
              eventDoneColor: Colors.grey[300],
              selectedColor: Colors.lightBlue,
              todayColor: Colors.blue,
              eventColor: Colors.blue,
              hideTodayIcon: true,
              isExpanded: true,
              dayOfWeekStyle: TextStyle(
                color: app.theme.textTheme.bodyText1.color,
                fontWeight: FontWeight.w800,
                fontSize: 12
              )
            ),
            _buildEventList(context),
          ]
        )
      )
    );
  }
}