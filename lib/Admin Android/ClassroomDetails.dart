import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Classroom Detail Page',
    home: ClassroomDetailPage(),
  ));
}

class ClassroomDetailPage extends StatefulWidget {
  @override
  _ClassroomDetailPageState createState() => _ClassroomDetailPageState();
}

class _ClassroomDetailPageState extends State<ClassroomDetailPage> {
  List<String> studentsInClass = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
    'Student 6',
    'Student 7',
    'Student 8',
    'Student 9',
    'Student 10',
    'Student 11',
    'Student 12',
  ];

  List<String> displayedStudents = [];

  @override
  void initState() {
    super.initState();
    displayedStudents.addAll(studentsInClass);
  }

  void filterStudents(String query) {
    setState(() {
      displayedStudents = studentsInClass
          .where((student) =>
              student.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void viewStudentDetails(String studentName) {
    // Navigate to the Student Details page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailsPage(studentName: studentName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classroom Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) => filterStudents(value),
              decoration: InputDecoration(
                labelText: 'Search Student',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: displayedStudents.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>
                        viewStudentDetails(displayedStudents[index]),
                    child: Card(
                      color: Color(0xFF3D73EB), // Background color as blue
                      child: ListTile(
                        title: Text(
                          displayedStudents[index],
                          style: TextStyle(color: Colors.white), // Text color as white
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentDetailsPage extends StatelessWidget {
  final String studentName;

  const StudentDetailsPage({required this.studentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Student Details for $studentName',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
