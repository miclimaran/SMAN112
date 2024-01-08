import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(AttendanceStudentTop());
}

class AttendanceStudentTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AttendanceStudent(),
      },
    );
  }
}

class AttendanceStudent extends StatelessWidget {
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
      appBar: AppBar(title: Text('Absen Page')),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(50.0), // Adjust margin
        child: Padding(
          padding: EdgeInsets.all(20.0), // Adjust padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      DateFormat('hh:mm a').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      'images/Map.png',
                      width: 300, // Adjust image size
                      height: 300, // Adjust image size
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Absen button pressed');
                        },
                        child: Text('Absen'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
