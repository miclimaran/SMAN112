import 'package:flutter/material.dart';

void main() {
  runApp(NotificationTeacher());
}

class NotificationTeacher extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'senderName': 'Admin Office',
      'senderImage': 'images/Profile.png',
      'notification': 'Reminder: School event tomorrow at 10 AM.'
    },
    {
      'senderName': 'Admin Office',
      'senderImage': 'images/Profile.png',
      'notification': 'Please submit attendance by 2 PM.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationBox(
              senderName: notifications[index]['senderName'],
              senderImage: notifications[index]['senderImage'],
              notification: notifications[index]['notification'],
            );
          },
        ),
      ),
    );
  }
}

class NotificationBox extends StatelessWidget {
  final String senderName;
  final String senderImage;
  final String notification;

  NotificationBox({
    required this.senderName,
    required this.senderImage,
    required this.notification,
  });

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
                  backgroundImage: AssetImage(senderImage),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  senderName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              notification,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
