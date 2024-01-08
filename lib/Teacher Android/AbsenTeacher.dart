import 'package:flutter/material.dart';
import 'package:sekolah_app/Teacher%20Android/HomepageTeacher.dart';

void main() {
  runApp(AbsenTeacher());
}

class AbsenTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Attendance'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomepageTeacher()),
            );
          },
        ),
        ),
        body: AttendanceContent(),
      ),
    );
  }
}

class AttendanceContent extends StatefulWidget {
  @override
  _AttendanceContentState createState() => _AttendanceContentState();
}

class _AttendanceContentState extends State<AttendanceContent> {
  String? selectedClass;
  List<String> classesList = [
    'X IPA 1',
    'X IPA 2',
    'X IPA 3',
    'XI IPA 1',
    'XI IPA 2',
    'XI IPA 3',
    'XII IPA 1',
    'XII IPA 2',
    'XII IPA 3',
    'X IPS 1',
    'X IPS 2',
    'X IPS 3',
    'XI IPS 1',
    'XI IPS 2',
    'XI IPS 3',
    'XII IPS 1',
    'XII IPS 2',
    'XII IPS 3',
  ];

  List<String> students = [
    'Jenni Adalyn',
    'Fleur Tyler',
    'Daly Kev',
    'Kaety Lucy',
    'Aurora Lois',
    'Milly Edgar',
    'Dan Arleen',
    'Bree Wrenlee',
    'Sherisse Alycia',
    'Mandi Ike'
  ]; // Replace this with your provided list of names
  Map<String, bool> attendance = {}; // Mapping of student names and their attendance status

  String getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    return formattedDate;
  }

  String getFormattedDay() {
    DateTime now = DateTime.now();
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    int dayIndex = now.weekday - 1; // Weekday returns 1 for Monday, 2 for Tuesday, and so on...
    return days[dayIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Day: ${getFormattedDay()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Date: ${getFormattedDate()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            hint: Text('Select Class'),
            value: selectedClass,
            onChanged: (newValue) {
              setState(() {
                selectedClass = newValue;
              });
            },
            items: classesList.map((className) {
              return DropdownMenuItem<String>(
                value: className,
                child: Text(className),
                key: Key(className), // Ensure each DropdownMenuItem has a unique key
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          if (selectedClass != null) ...[
            Text(
              'Attendance for $selectedClass',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  final student = students[index];
                  return ListTile(
                    title: Text(student),
                    trailing: Checkbox(
                      value: attendance.containsKey(student) ? attendance[student] : false,
                      onChanged: (bool? value) {
                        setState(() {
                          attendance[student] = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Attendance Telah Berhasil !',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Submit Attendance'),
            ),
          ],
        ],
      ),
    );
  }
}
