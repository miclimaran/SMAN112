import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sekolah_app/StudentAndroid/Homepage2.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(ScheduleStudent());
}

class ScheduleStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => ScheduleStudentPage());
          case '/Homepage2':
            return MaterialPageRoute(builder: (_) => Homepage2());
          default:
            return null;
        }
      },
    );
  }
}

class ScheduleStudentPage extends StatefulWidget {
  @override
  _ScheduleStudentPageState createState() => _ScheduleStudentPageState();
}

class _ScheduleStudentPageState extends State<ScheduleStudentPage> {
  DateTime? selectedDate;
  List<Map<String, String>> currentSchedule = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Schedule'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage2()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blue,
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2050, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                  updateCurrentSchedule(selectedDay);
                });
              },
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: {
                CalendarFormat.month: 'Month',
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.white),
                outsideTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(color: Colors.white),
                selectedTextStyle: TextStyle(color: Colors.white),
                holidayTextStyle: TextStyle(color: Colors.white),
                weekNumberTextStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          if (selectedDate != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEEE').format(selectedDate!),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    DateFormat('dd MMMM yyyy').format(selectedDate!),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: currentSchedule.isEmpty
                  ? Center(child: Text('No Class'))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final data = currentSchedule[index];
                        return ListTile(
                          title: Text(data['time']!),
                          subtitle: Text('${data['lecture']}'),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: currentSchedule.length,
                    ),
            ),
          ],
        ],
      ),
    );
  }

  List<Map<String, String>> scheduleData1 = [
    {'time': '08:00 AM', 'lecture': 'Matematika'},
    {'time': '10:00 AM', 'lecture': 'Fisika'},
    {'time': '01:00 PM', 'lecture': 'Kimia'},
    {'time': '03:00 PM', 'lecture': 'Sejarah'},
  ];

  List<Map<String, String>> scheduleData2 = [
    {'time': '08:00 AM', 'lecture': 'Bahasa Indonesia'},
    {'time': '10:00 AM', 'lecture': 'Bahasa Inggris'},
    {'time': '01:00 PM', 'lecture': 'Fisika'},
    {'time': '03:00 PM', 'lecture': 'Akuntansi'},
  ];

  List<Map<String, String>> scheduleData3 = [
    {'time': '08:00 AM', 'lecture': 'Sejarah'},
    {'time': '10:00 AM', 'lecture': 'Biologi'},
    {'time': '01:00 PM', 'lecture': 'Fisika'},
    {'time': '03:00 PM', 'lecture': 'Matematika'},
  ];

  List<Map<String, String>> scheduleData4 = [
    {'time': '08:00 AM', 'lecture': 'Matematika'},
    {'time': '10:00 AM', 'lecture': 'OR'},
    {'time': '01:00 PM', 'lecture': 'Bahasa Mandarin'},
    {'time': '03:00 PM', 'lecture': 'Fisika'},
  ];

  List<Map<String, String>> scheduleData5 = [
    {'time': '08:00 AM', 'lecture': 'Geografi'},
    {'time': '10:00 AM', 'lecture': 'Seni Musik'},
    {'time': '01:00 PM', 'lecture': 'IT'},
    {'time': '03:00 PM', 'lecture': 'Seni Lukis'},
  ];

  void updateCurrentSchedule(DateTime selectedDay) {
    final dayOfWeek = selectedDay.weekday;

    switch (dayOfWeek) {
      case DateTime.monday:
        setState(() {
          currentSchedule = scheduleData1;
        });
        break;
      case DateTime.tuesday:
        setState(() {
          currentSchedule = scheduleData2;
        });
        break;
      case DateTime.wednesday:
        setState(() {
          currentSchedule = scheduleData3;
        });
        break;
      case DateTime.thursday:
        setState(() {
          currentSchedule = scheduleData4;
        });
        break;
      case DateTime.friday:
        setState(() {
          currentSchedule = scheduleData5;
        });
        break;
      default:
        setState(() {
          currentSchedule = [];
        });
        break;
    }
  }
}
