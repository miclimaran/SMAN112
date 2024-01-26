// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sekolah_app/Model/DataUser.dart';
// import 'package:sekolah_app/Model/UserRepo.dart';
// import 'package:sekolah_app/Teacher%20Android/HomepageTeacher.dart';

// // void main() {
// //   runApp(FeedbackTeacher());
// // }

// // class FeedbackTeacher extends StatefulWidget {
// //   @override
// //   _FeedbackTeacherState createState() => _FeedbackTeacherState();
// // }

// // class _FeedbackTeacherState extends State<FeedbackTeacher> {
// //   late List<String> feedbackList; // Change the type to List<String>

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize the feedbackList
// //     feedbackList = [];

// //     // Fetch feedback data when the widget is created
// //     fetchFeedbackData();
// //   }

// //   Future<void> fetchFeedbackData() async {
// //     try {
// //       // Get a reference to the Firestore instance
// //       FirebaseFirestore firestore = FirebaseFirestore.instance;

// //       // Reference to the 'Feedback' collection
// //       CollectionReference feedbackCollection = firestore.collection('Feedback');

// //       // Get the documents from the collection
// //       QuerySnapshot querySnapshot = await feedbackCollection.get();

// //       // Extract data from documents and update the state
// //       setState(() {
// //         feedbackList = querySnapshot.docs.map((doc) => doc.data()['feedback'] as String).toList();
// //       });
// //     } catch (e) {
// //       // Handle errors here
// //       print('Error fetching feedback data: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     String teacherEmail = DataUser().email;

// //     return MaterialApp(
// //       title: 'Feedback Viewer',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Feedback Viewer'),
// //           leading: IconButton(
// //             icon: Icon(Icons.arrow_back),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => HomepageTeacher()),
// //               );
// //             },
// //           ),
// //         ),
// //         body: FutureBuilder<List<String>>(
// //           future: fetchAttendance(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return CircularProgressIndicator();
// //             } else if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             } else {
// //               return ListView.builder(
// //                 itemCount: snapshot.data?.length ?? 0,
// //                 itemBuilder: (context, index) {
// //                   return FeedbackBox(
// //                     name: 'Unknown', // You may need to modify this based on your use case
// //                     date: '', // You may need to modify this based on your use case
// //                     feedback: snapshot.data?[index] ?? 'No feedback available',
// //                   );
// //                 },
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   Future<List<String>> fetchAttendance() async {
// //     try {
// //       // Simulating the data fetching process
// //       // Replace this with the actual logic to fetch student details
// //       UserRepo userRepo = UserRepo();
// //       String teacherEmail = DataUser().email;
// //       List<String> studentDetails = await userRepo.getAllAttendanceDetails(teacherEmail);
// //       return studentDetails;
// //     } catch (e) {
// //       // Handle errors here
// //       print('Error fetching attendance data: $e');
// //       return [];
// //     }
// //   }
// // }

// // class FeedbackBox extends StatelessWidget {
// //   final String name;
// //   final String date;
// //   final String feedback;

// //   FeedbackBox({
// //     required this.name,
// //     required this.date,
// //     required this.feedback,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: EdgeInsets.all(10),
// //       color: Color(0xFF3D73EB),
// //       child: Padding(
// //         padding: EdgeInsets.all(10),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 CircleAvatar(
// //                   backgroundImage: AssetImage('Profile.png'),
// //                   radius: 25,
// //                 ),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   name,
// //                   style: TextStyle(
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFFFFFFFF),
// //                   ),
// //                 ),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   date,
// //                   style: TextStyle(
// //                     fontSize: 15,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFFFFFFFF),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               feedback,
// //               style: TextStyle(
// //                 fontSize: 12,
// //                 color: Color(0xFFFFFFFF),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// void main() {
//   runApp(FeedbackTeacher());
// }

// class FeedbackTeacher extends StatefulWidget {
//   @override
//   _FeedbackTeacherState createState() => _FeedbackTeacherState();
// }

// class _FeedbackTeacherState extends State<FeedbackTeacher> {

// List<String> detailStudent = [];
// String teacherEmail = DataUser().email;

//   @override
//   void initState() {
//     super.initState();
//     fetchStudentDetails();
//   }

//   Future<void> fetchStudentDetails() async {
//     // Simulating the data fetching process
//     // Replace this with the actual logic to fetch student details
//     UserRepo userRepo = UserRepo();
//     List<String> studentDetails = await userRepo.getAllAttendanceDetails(teacherEmail);

//     // Simulated data
//     // List<String> studentDetails = [
//     //   'Name: Michael Limaran',
//     //   'Email: Michael.limaran@student.ac.id',
//     //   'Role: Student',
//     //   'ID: STD001',
//     //   'Class: XA1',
//     // ];

//     setState(() {
//       detailStudent = studentDetails;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             for (var detail in detailStudent)
//               Card(
//                 elevation: 4.0,
//                 margin: EdgeInsets.only(bottom: 12.0),
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.person,
//                     color: Colors.blue,
//                   ),
//                   title: Text(
//                     detail,
//                     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:sekolah_app/Teacher%20Android/HomepageTeacher.dart';

void main() {
  runApp(FeedbackTeacher());
}

class FeedbackTeacher extends StatelessWidget {
  final List<Map<String, dynamic>> feedbackList = [
    {
      'name': 'Michael',
      'image': 'images/Baazar.png',
      'feedback': 'Sudah sangat baik, tetapi ada banyak yang perlu diperhatikan.'
    },
    {
      'name': 'Limaran',
      'image': 'images/Baazar2.png',
      'feedback': 'Saya ada kurang mengerti disaat bapak mengajarkan materi turunan.'
    },
    {
      'name': 'Charlie',
      'image': 'images/Baazar2.png',
      'feedback': 'Untuk pembahasannya sudah baik, tetapi untuk ulangannya tidak sesuai dengan pembahasan yang bapak kasih'
    },
    {
      'name': 'Chaplin',
      'image': 'images/Baazar2.png',
      'feedback': 'Saya ada kurang mengerti disaat bapak mengajarkan materi, dikarenakan sangat cepat.'
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
            return MaterialPageRoute(builder: (_) => FeedbackTeacher());
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
              MaterialPageRoute(builder: (context) => HomepageTeacher()),
            );
          },
        ),),
        body: ListView.builder(
          itemCount: feedbackList.length,
          itemBuilder: (context, index) {
            return FeedbackBox(
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

class FeedbackBox extends StatelessWidget {
  final String name;
  final String image;
  final String feedback;

  FeedbackBox({required this.name, required this.image, required this.feedback});

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
