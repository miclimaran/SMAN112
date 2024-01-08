import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Create New Class',
    home: CreateNewClassPage(),
  ));
}

class CreateNewClassPage extends StatelessWidget {
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
              decoration: InputDecoration(
                labelText: 'Nama Kelas',
                hintText: 'Enter the class name',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Wali Kelas',
                hintText: 'Enter the Wali Kelas',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Add functionality to create a new class
                // This is where you'll handle the logic to create a new class
                // For example, save the class details to a database.
                print('Create Class button pressed');
              },
              child: Text('Create Class'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3D73EB), // Background color as blue
                onPrimary: Colors.white, // Text color as white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
