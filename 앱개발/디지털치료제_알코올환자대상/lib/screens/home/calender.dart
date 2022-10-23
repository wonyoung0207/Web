import 'dart:core';

import 'package:alcohol_project/models/myDateTime.dart';
import 'package:alcohol_project/models/user.dart';
import 'package:alcohol_project/service/database.dart';
import 'package:alcohol_project/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:provider/provider.dart';

// class CalenarScreen extends StatefulWidget {
//   const CalenarScreen({Key? key}) : super(key: key);
//
//   @override
//   _CalenarScreenState createState() => _CalenarScreenState();
// }
//
// class _CalenarScreenState extends State<CalenarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return _CalendarScreenState();
//   }
// }


class CalendarScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {

  final Map<DateTime, List<CleanCalendarEvent>> _events = {
  };

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    return StreamBuilder<myDateTime>(
      stream: DatabaseService(uid: user.uid).calendar_dateTime,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          var split_data = snapshot.data!.cur_dateTime.split(',');
          for(int i=0; i < split_data.length; i++){
            _events.addAll(
                {
                  DateTime(int.parse(split_data[i].substring(0,4)), int.parse(split_data[i].substring(5,7)), int.parse(split_data[i].substring(8))):[
                    CleanCalendarEvent('Event H',
                        startTime: DateTime(int.parse(split_data[i].substring(0,4)), int.parse(split_data[i].substring(5,7)),
                            int.parse(split_data[i].substring(8)), 14, 30),
                        endTime: DateTime(int.parse(split_data[i].substring(0,4)), int.parse(split_data[i].substring(5,7)),
                            int.parse(split_data[i].substring(8)), 17, 0),
                        color: Colors.pink),
                  ]
                }
            );
          }
          return Scaffold(
            body: Column(

              children: [
                Container(
                  height: 285,
                  child: Calendar(
                    startOnMonday: true,
                    weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    events: _events,
                    //isExpandable: true,
                    eventDoneColor: Colors.green,
                    selectedColor: Colors.pink,
                    todayColor: Colors.blue,
                    eventColor: Colors.pink,
                    locale: 'KOREA',
                    // todayButtonText: 'Heute',
                    isExpanded: true,
                    //expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                    dayOfWeekStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w800, fontSize: 11),
                  ),
                ),
              ],
            ),
          );
        }else{
          return Loading();
        }
      }
    );
  }

void _handleNewDate(date) {
    print('Date selected: $date');
  }
}