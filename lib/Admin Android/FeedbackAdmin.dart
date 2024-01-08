import 'package:flutter/material.dart';
import 'package:sekolah_app/Admin%20Android/HomepageAdmin.dart';


void main() {
  runApp(FeedbackAdminTop());
}

class FeedbackAdminTop extends StatelessWidget {
  final List<Map<String, dynamic>> feedbackList = [
    {
      'name': 'Michael',
      'image': 'images/Baazar.png',
      'feedback': 'Ada yang kurang dari aplikasinya.'
    },
    {
      'name': 'Limaran',
      'image': 'images/Baazar2.png',
      'feedback': 'Ada yang kurang dari aplikasinya.'
    },
    {
      'name': 'Charlie',
      'image': 'images/Baazar2.png',
      'feedback': 'Ada yang kurang dari aplikasinya.'
    },
    {
      'name': 'Chaplin',
      'image': 'images/Baazar2.png',
      'feedback': 'Ada yang kurang dari aplikasinya.'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => FeedbackAdminTop());
          default:
            return null;
        }
      },
      home: Scaffold(
        appBar: AppBar(title: Text('Feedback Viewer'),leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomepageAdmin()),
            );
          },
        ),),
        body: ListView.builder(
          itemCount: feedbackList.length,
          itemBuilder: (context, index) {
            return FeedbackAdmin(
              name: feedbackList[index]['name'],
              image: feedbackList[index]['image'],
              feedback: feedbackList[index]['feedback'],
            );
          },
        ),
      ),
    );
  }
}

class FeedbackAdmin extends StatelessWidget {
  final String name;
  final String image;
  final String feedback;

  FeedbackAdmin({required this.name, required this.image, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Color(0xFF3D73EB),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF)
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
                  feedback,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFFFFFF)
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
