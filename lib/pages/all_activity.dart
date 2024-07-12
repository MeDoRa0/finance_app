import 'package:finance_app/managment/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/models/finance_model.dart';
import 'package:finance_app/widgets/activity_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late FetchDataCubit _fetchDataCubit;

  /* @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<FetchDataCubit>(context)
        .fetchDateDate(dateTime: mySelectedDay);
  }*/
  @override
  void initState() {
    super.initState();
    _fetchDataCubit = BlocProvider.of<FetchDataCubit>(context);
    _fetchDataCubit.fetchDateDate(dateTime: mySelectedDay);
  }

  @override
  void dispose() {
    // Reset the selected date to today when leaving the page
    _fetchDataCubit.resetDateToToday();
    _fetchDataCubit.fetchData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Activites'),
      ),
      body: BlocBuilder<FetchDataCubit, FetchDataState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //this widget to build a table calnder
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
                        _fetchDataCubit.selectedTime = selectedDay;
                      },
                    );
                    // fetch data every time i select a day to show items of this day
                    _fetchDataCubit.fetchDateDate(dateTime: mySelectedDay);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _fetchDataCubit.todayFinanacList.length,
                    itemBuilder: (context, index) {
                      List<FinanceModel> myList =
                          _fetchDataCubit.todayFinanacList;
                      return ActivityItem(
                        financeModel: myList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
