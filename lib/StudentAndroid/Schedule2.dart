import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date and time formatting
// import 'SubmitFeedback.dart';
import 'AttendanceStudent.dart';

void main() {
  runApp(Schedule2Top());
}

class Schedule2Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => Schedule2());
          // case '/SubmitFeedback':
          //   return MaterialPageRoute(builder: (_) => SubmitFeedback());
          case '/AttendanceStudent':
            return MaterialPageRoute(builder: (_) => AttendanceStudent());
          // Add more cases for other routes if needed
          default:
            return null;
        }
      },
    );
  }
}

class Schedule2 extends StatelessWidget {
  final String username = "Michael";
  final String imageUrl = "images/Profile.png";

  final List<Map<String, String>> lectureSchedule = [
    {'time': '08:00 AM', 'lecture': 'Mathematics'},
    {'time': '10:00 AM', 'lecture': 'Physics'},
    {'time': '01:00 PM', 'lecture': 'Chemistry'},
    {'time': '03.00 PM', 'lecture': 'Indonesian'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    DataTable(
                      columns: [
                        DataColumn(
                            label:
                                Expanded(child: Center(child: Text('Time')))),
                        DataColumn(
                            label: Expanded(
                                child: Center(child: Text('Lecture')))),
                      ],
                      rows: lectureSchedule.map((schedule) {
                        return DataRow(cells: [
                          DataCell(Expanded(
                              child: Center(child: Text(schedule['time']!)))),
                          DataCell(Expanded(
                              child:
                                  Center(child: Text(schedule['lecture']!)))),
                        ]);
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SubmitFeedback()),
                        //     );
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Colors
                        //         .blue, // Change color to match your color palette
                        //   ),
                        //   child: Text('Submit Feedback',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //       )),
                        // ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttendanceStudent()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .blue, // Change color to match your color palette
                          ),
                          child: Text('See Attendance',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
