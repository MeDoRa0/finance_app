import 'package:finance_app/widgets/activity_item.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AllActivityPage extends StatefulWidget {
  const AllActivityPage({super.key});

  @override
  State<AllActivityPage> createState() => _AllActivityPageState();
}

class _AllActivityPageState extends State<AllActivityPage> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime mySelectedDay = DateTime.now();
  DateTime myFocusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Activites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime(2024),
              lastDay: DateTime.now(),
              focusedDay: myFocusedDay,
              calendarFormat: calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  calendarFormat = format;
                });
              },
              currentDay: mySelectedDay,
              onDaySelected: (selectedDay, focusedDay) {
                setState(
                  () {
                    mySelectedDay = selectedDay;
                    myFocusedDay = focusedDay;
                  },
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ActivityItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
