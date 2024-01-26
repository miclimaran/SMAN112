// import 'package:flutter/material.dart';
// import 'package:sekolah_app/Model/DataUser.dart';
// import 'package:sekolah_app/Model/UserRepo.dart';

// void main() {
//   runApp(MyAccountAdmin());
// }

// class MyAccountAdmin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Account',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyAccountScreenAdmin(),
//     );
//   }
// }

// class MyAccountScreenAdmin extends StatefulWidget {
//   @override
//   _MyAccountScreenAdminState createState() => _MyAccountScreenAdminState();
// }

// class _MyAccountScreenAdminState extends State<MyAccountScreenAdmin> {
//   List<String> detailStudent = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch user data when the widget is created
//     fetchStudentDetails();
//   }

//   Future<void> fetchStudentDetails() async {
//     // Simulating the data fetching process
//     // Replace this with the actual logic to fetch student details
//     UserRepo userRepo = UserRepo();
//     List<String> studentDetails = await userRepo.getAllStudentDetailsbyEmail(DataUser().email);

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
//     // String username = '';
//     // String role = '';
//     // String email = '';
//     // String id = '';
//     // String classs = '';

//     // if (detailStudent.length >= 5) {
//     //   username = detailStudent[0];
//     //   role = detailStudent[1];
//     //   email = detailStudent[2];
//     //   id = detailStudent[3];
//     //   classs = detailStudent[4];
//     // }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Account'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage('images/Profile.png'), // Replace with user's profile image
//                   ),
//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Functionality to change profile picture
//                       // Implement your logic here
//                     },
//                     child: Text('Change Profile Picture'),
//                   ),
//                 ],
//               ),
//             ),
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

//   Widget buildTextField(String title, String content) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(content),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

void main() {
  runApp(MyAccountAdmin());
}

class MyAccountAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Account',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAccountScreenAdmin(),
    );
  }
}

class MyAccountScreenAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/Profile.png'), // Replace with user's profile image
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Functionality to change profile picture
                      // Implement your logic here
                    },
                    child: Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildTextField('Username', 'Irwan'), // Replace with user data
            buildTextField('Role', 'Admin'), // Replace with user data
            buildTextField('Email', 'Irwan@admin.ac.id'), // Replace with user data
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String title, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
