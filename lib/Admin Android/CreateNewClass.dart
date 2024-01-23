import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    title: 'Create New Class',
    home: CreateNewClassPage(),
  ));
}

class CreateNewClassPage extends StatelessWidget {
  final TextEditingController classNameController = TextEditingController();
  final TextEditingController waliKelasController = TextEditingController();

  Future<void> createClass() async {
    String className = classNameController.text.trim();
    String waliKelas = waliKelasController.text.trim();

    if (className.isNotEmpty && waliKelas.isNotEmpty) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      CollectionReference classes = firestore.collection('classes');

      await classes.add({
        'name': className,
        'teacherId': waliKelas,
      });

      // Display a success message
      print('Class created successfully');

      classNameController.clear();
      waliKelasController.clear();
    } else {
      print('Please enter both class name and Teacher Id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Classroom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: classNameController,
              decoration: InputDecoration(
                labelText: 'Nama Kelas',
                hintText: 'Enter the class name',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: waliKelasController,
              decoration: InputDecoration(
                labelText: 'Homeroom Teacher Id',
                hintText: 'Enter the Homeroom Teacher Id',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                createClass(); // Call the function to create a new class
              },
              child: Text('Create Class'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3D73EB),
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
