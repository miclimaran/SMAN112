import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sekolah_app/Model/DataUser.dart';
import 'package:sekolah_app/Model/UserRepo.dart';

class AnnouncementPage extends StatefulWidget {
  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  UserRepo userRepo = UserRepo();
  String selectedCategory = 'Semua';
  String adminEmail = '';
  String adminIds = '';
  List<String> recipients = [];
  TextEditingController announcementController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch classroom names when the widget is created
    fetchAdminID();
  }

  Future<void> fetchAdminID() async {
    adminEmail = DataUser().email;
    UserRepo userRepo = UserRepo();
    String classroomList = await userRepo.getStudentIdbyEmail(adminEmail);
    setState(() {
      adminIds = classroomList;
    });
  }

  Future<void> sendAnnouncement() async {
    if (announcementController.text.isEmpty) {
      // Show error if the announcement is not provided
      _showErrorSnackBar('Please write the announcement!');
      return;
    }

    if ((selectedCategory == 'Guru' || selectedCategory == 'Murid') &&
        recipients.isEmpty) {
      // Show error if recipients are not chosen for Guru or Murid category
      _showErrorSnackBar('Please choose recipients individually!');
      return;
    }

    // Replace 'your_collection' with your actual Firestore collection name
    final CollectionReference announcements =
        FirebaseFirestore.instance.collection('Announcement');

    // Simulated adminId, replace with actual admin ID
    String adminId = adminIds;

    // Prepare data to be sent to Firestore
    Map<String, dynamic> data = {
      'adminId': adminId,
      'announcement': announcementController.text,
      'recipient': recipients.join(', '), // Join recipients into a single string
    };

    // Add the data to Firestore
    await announcements.add(data);

    // Clear the text field after sending the announcement
    announcementController.clear();
    recipients.clear();

    // Show a snackbar to indicate success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Announcement Sent!'),
      ),
    );
  }

  Future<void> _showRecipientsDialog(BuildContext context) async {
    // Simulated data, replace with actual data fetching logic
    UserRepo userRepo = UserRepo();
    List<String> allStudentName = await userRepo.getAllStudent();
    List<String> allTeacherName = await userRepo.getAllTeacher();

    List<String> allRecipients =
        selectedCategory == 'Guru' ? allTeacherName : allStudentName;

    bool isGuru = selectedCategory == 'Guru';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Recipients'),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    for (String recipient in allRecipients)
                      CheckboxListTile(
                        title: Text(recipient),
                        value: recipients.contains(recipient),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              if (value) {
                                recipients.add(recipient);
                              } else {
                                recipients.remove(recipient);
                              }
                            }
                          });
                        },
                      ),
                  ],
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (recipients.isEmpty) {
                  // Show error if no recipients are chosen
                  _showErrorSnackBar('Please choose at least one recipient!');
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Announcement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue!;
                  recipients.clear(); // Clear recipients when category changes
                });
              },
              items: [
                'Semua',
                'Semua Guru',
                'Semua Murid',
                'Guru',
                'Murid',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (selectedCategory == 'Guru' || selectedCategory == 'Murid') ...[
              ElevatedButton(
                onPressed: () {
                  _showRecipientsDialog(context);
                },
                child: Text('Choose Recipients'),
              ),
              SizedBox(height: 20),
            ],
            TextField(
              controller: announcementController,
              decoration: InputDecoration(
                labelText: 'Announcement',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendAnnouncement();
              },
              child: Text('Send Announcement'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AnnouncementPage(),
  ));
}
