import 'package:flutter/material.dart';
import 'package:sekolah_app/Admin%20Android/ClassroomDetails.dart';
import 'package:sekolah_app/Admin%20Android/CreateNewClass.dart';

void main() {
  runApp(MaterialApp(
    title: 'Classroom Page',
    home: ClassroomAdminPage(),
  ));
}

class ClassroomAdminPage extends StatelessWidget {
  final List<String> classroomNames = [
    'X IPA 1',
    'X IPA 2',
    'X IPA 3',
    'XI IPA 1',
    'XI IPA 2',
    'XI IPA 3',
    'XII IPA 1',
    'XII IPA 2',
    'XII IPA 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classroom'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: List.generate(classroomNames.length, (index) {
                  return ClassroomButton(
                    className: classroomNames[index],
                    onPressed: () {

                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClassroomDetailPage()),
                    );

                      print('Pressed: ${classroomNames[index]}');
                    },
                  );
                }),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateNewClassPage()),
                    );
                print('Create New Class');
              },
              child: Text('Create New Class',style: TextStyle(color: Color(0xFFFFFFFF)),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3D73EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Border radius here
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassroomButton extends StatelessWidget {
  final String className;
  final VoidCallback onPressed;

  const ClassroomButton({
    required this.className,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(className),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Border radius here
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
    );
    
  }
}
