import 'package:Debug/src/providers/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/calendar_tile.dart';
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
      {'name': 'Nueva Cita', 'isDone': true},
    ],
    DateTime(2020, 6, 9): [
      {'name': 'Nueva Cita', 'isDone': true},
      {'name': 'Nueva Cita', 'isDone': true},
    ],
    DateTime(2020, 6, 10): [
      {'name': 'Nueva Cita', 'isDone': true},
      {'name': 'Nueva Cita', 'isDone': true},
    ],
    DateTime(2020, 6, 13): [
      {'name': 'Nueva Cita', 'isDone': true},
      {'name': 'Nueva Cita', 'isDone': true},
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 25): [
      {'name': 'Nueva Cita', 'isDone': true},
      {'name': 'Nueva Cita', 'isDone': true},
      {'name': 'Nueva Cita', 'isDone': false},
    ],
    DateTime(2020, 6, 6): [
      {'name': 'Nueva Cita', 'isDone': false},
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          ),
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
            _buildEventList(),
          ]
        )
      )
    );
  }
}