import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sekolah_app/StudentAndroid/Homepage2.dart';

void main() {
  runApp(SubmitFeedback());
}

class SubmitFeedback extends StatelessWidget {
  final List<String> teachers = [
    'Semua Guru',
    'Pak Kevin',
    'Pak Michael',
  ]; // Replace this with your list of teachers

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Submit Feedback',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => SubmitFeedback());
          case '/Homepage2':
            return MaterialPageRoute(builder: (_) => Homepage2());
          default:
            return null;
        }
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Submit Feedback'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Feedback & Suggestion',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Insert your feedback and suggestion here...',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Ditujukan Kepada',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: DropdownButtonFormField<String>(
                          items: teachers.map((String teacher) {
                            return DropdownMenuItem<String>(
                              value: teacher,
                              child: Text(teacher),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            // Handle dropdown value change
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _showFeedbackSentDialog(context); // Show feedback sent dialog
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, // Background color
                          onPrimary: Colors.black, // Text color
                        ),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to show feedback sent dialog
  Future<void> _showFeedbackSentDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Disallow dismissing the dialog on tap
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 60),
                SizedBox(height: 20),
                Text(
                  'Feedback Sent!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Thank you for your feedback.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage2()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
