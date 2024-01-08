import 'package:flutter/material.dart';
import 'package:sekolah_app/Admin%20Android/MyAccountAdmin.dart';
import 'package:sekolah_app/StudentAndroid/LogInPage.dart';
import 'package:sekolah_app/Teacher%20Android/HomepageTeacher.dart';
import 'package:sekolah_app/Teacher%20Android/MyAccountTeacher.dart';

void main() {
  runApp(ProfileAdmin());
}

class ProfileAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
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
        body: ProfileContentAdmin(),
      ),
    );
  }
}

class ProfileContentAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 4.0,
            color: Colors.blue, // Set the card background color
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/Profile.png'), // Replace with teacher's image
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Jeffrey', // Replace with actual teacher's name
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Admin', // Replace with actual teacher's role
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccountAdmin()),
                    );
              print('Navigate to My Account');
            },
            icon: Icon(Icons.account_circle),
            label: Text('My Account'),
            style: ElevatedButton.styleFrom(primary: Colors.transparent, onPrimary: Colors.black),
          ),
          ElevatedButton.icon(
            onPressed: () {
              print('Navigate to About App');
            },
            icon: Icon(Icons.info),
            label: Text('About App'),
            style: ElevatedButton.styleFrom(primary: Colors.transparent, onPrimary: Colors.black),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              print('Log Out');
            },
            icon: Icon(Icons.logout),
            label: Text('Log Out'),
            style: ElevatedButton.styleFrom(primary: Colors.transparent, onPrimary: Colors.black),
          ),
        ],
      ),
    );
  }
}
