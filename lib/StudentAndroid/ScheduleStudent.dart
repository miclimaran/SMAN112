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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final data = scheduleData[index];
                  return ListTile(
                    title: Text(data['time']!),
                    subtitle: Text('${data['lecture']}'),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: scheduleData.length,
              ),
            ),
          ],
        ],
      ),
    );
  }

  List<Map<String, String>> scheduleData = [
    {'time': '08:00 AM', 'lecture': 'Matematika'},
    {'time': '10:00 AM', 'lecture': 'Fisika'},
    {'time': '01:00 PM', 'lecture': 'Kimia'},
    {'time': '03:00 PM', 'lecture': 'Sejarah'},
  ];
}
