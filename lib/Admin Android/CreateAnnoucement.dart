import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Announcement App',
    home: CreateAnnouncementPage(),
  ));
}

class CreateAnnouncementPage extends StatefulWidget {
  @override
  _CreateAnnouncementPageState createState() => _CreateAnnouncementPageState();
}

class _CreateAnnouncementPageState extends State<CreateAnnouncementPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<Map<String, dynamic>> announcements = [];

  List<String> imageList = [
    'images/Baazar.png',
    'images/Baazar2.jpg',
    'images/Baazar3.jpeg',
    'images/Baazar4.png',
  ];

  List<String> titleList = [
    'Baazar 1', // Replace with actual titles
    'Baazar 2',
    'Baazar 3',
    'Baazar 4',
    // Add more titles as needed
  ];

  List<String> descriptionList = [
    'Description for Baazar 1',
    'Description for Baazar 2',
    'Description for Baazar 3',
    'Description for Baazar 4',
    // Add more descriptions as needed
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < imageList.length; i++) {
      announcements.add({
        'image': imageList[i],
        'title': titleList[i],
        'description': descriptionList[i],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _navigateToCreateAnnouncement();
            },
          ),
        ],
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
                children: _buildAnnouncementCards(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnnouncementCards() {
    List<Widget> cards = [];
    for (int i = 0; i < announcements.length; i++) {
      cards.add(
        Card(
          margin: EdgeInsets.all(12.0), // Reduce margin to prevent overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.6,
                child: Image.asset(
                  announcements[i]['image'],
                ),
              ),
              ListTile(
                title: Text(announcements[i]['title']),
                subtitle: Text(announcements[i]['description']),
              ),
            ],
          ),
        ),
      );
    }
    return cards;
  }

  void _navigateToCreateAnnouncement() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAnnouncementPage()),
    );

    if (result != null && result.containsKey('title') && result.containsKey('description')) {
      setState(() {
        announcements.add({
          'title': result['title'],
          'description': result['description'],
        });
      });
    }
  }
}

class AddAnnouncementPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Announcement')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'title': titleController.text,
                  'description': descriptionController.text,
                });
              },
              child: Text('Create Announcement'),
            ),
          ],
        ),
      ),
    );
  }
}
