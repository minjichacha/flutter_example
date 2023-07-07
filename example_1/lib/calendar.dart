//import 'dart:html';

import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TableCalendarMain extends StatefulWidget {
  const TableCalendarMain({super.key});

  @override
  State<StatefulWidget> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendarMain> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //appBar: AppBar(),
      //body:
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: DateTime.now(),
        calendarFormat: _calendarFormat,
        locale: 'ko-KR',
        daysOfWeekHeight: 30,
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
        ),
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            switch (day.weekday) {
              case 1:
                return Center(
                  child: Text('월'),
                );
              case 2:
                return Center(
                  child: Text('화'),
                );
              case 3:
                return Center(
                  child: Text('수'),
                );
              case 4:
                return Center(
                  child: Text('목'),
                );
              case 5:
                return Center(
                  child: Text('금'),
                );
              case 6:
                return Center(
                  child: Text('토'),
                );
              case 7:
                return Center(
                  child: Text(
                    '일',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
            }
          },
          todayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // ),
        selectedDayPredicate: (DateTime day) {
          return isSameDay(selectedDay, day);
        },
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          setState(() {
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          this.focusedDay = focusedDay;
        },
      ),
    );
  }
}
