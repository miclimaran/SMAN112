

import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepo {

Future<List<String>> getStudentClasses() async {
    List<String> studentClasses = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> user in snapshot.docs) {
        String studentClass = user['class'] as String;
        studentClasses.add(studentClass);
      }
    } catch (e) {
      print('Error fetching student classes: $e');
    }

    Set<String> studentC = Set<String>.from(studentClasses);
    List<String> studentClassList = studentC.toList();

    return studentClassList;
  }

  Future<List<String>> getStudentForClass(String kelas) async {
    List<String> studentNames = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'Student')
          .where('class', isEqualTo: kelas)
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> user in snapshot.docs) {
        String studentName = user['name'] as String;
        studentNames.add(studentName);
      }
    } catch (e) {
      print('Error fetching student classes: $e');
    }

    return studentNames;
  }

    Future<void> storeAttendance(String date, String status, String studentId, String teacherId) async {
    try {
      await FirebaseFirestore.instance.collection('Attendance').add({
        'date': date,
        'status': status,
        'studentId': studentId,
        'teacherId': teacherId,
      });
    } catch (e) {
      print('Error storing attendance: $e');
    }
  }

Future<String> getName(String email) async {
    String name = '';

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

for (QueryDocumentSnapshot<Map<String, dynamic>> user in snapshot.docs) {
        name = user['name'] as String;
      }
          

    } catch (e) {
      print('Error fetching student name: $e');
    }

    return name;
  }


 Future<String> getStudentId(String email) async {
  String studentId = "";

  print(email);

  try {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> user in snapshot.docs) {
      studentId = user['id'] as String;
    }
  } catch (e) {
    print('Error fetching student classes: $e');
  }

  print(studentId);

  return studentId;
}

Future<String> getAttendance(String dates, String email) async {
  print(dates);
  print(email);

  String attendance = "";

  try {
    // Get studentId using getStudentId
    String studentId = await getStudentId(email);

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('Attendance')
        .where('date', isEqualTo: dates)
        .where('studentId', isEqualTo: studentId)
        .get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> attendances in snapshot.docs) {
      attendance = attendances['status'] as String;
    }
  } catch (e) {
    print('Error fetching student classes: $e');
  }

  return attendance;
}


Future<List<String>> getTeacher() async {
    List<String> teachers = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: "Teacher")
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> user in snapshot.docs) {
        String teacher = user['name'] as String;
        teachers.add(teacher);
      }
    } catch (e) {
      print('Error fetching student classes: $e');
    }

    Set<String> studentC = Set<String>.from(teachers);
    List<String> studentClassList = studentC.toList();

    return studentClassList;
  }


Future<List<String>> getAllClassroom() async {
    List<String> classrooms = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('users')
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> user in snapshot.docs) {
        String classroom = user['class'] as String;
        classrooms.add(classroom);
      }
    } catch (e) {
      print('Error fetching student classes: $e');
    }

    Set<String> studentC = Set<String>.from(classrooms);
    List<String> classroomlist = studentC.toList();

    return classroomlist;
  }
  
}




// StreamBuilder<QuerySnapshot> (
//   stream: FirebaseFirestore.instance.collection('users').snapshots(),builder:(context, snapshot){
//     List<Row> userWidgets = [];

//     String teacherClass = '';

//     if(snapshot.hasData){
//       final users = snapshot.data?.docs.reversed.toList();
//       for(final user in users!){
//         print(Text(user['name']));
//         print(Text(user['class']));
//         print(Text(user['email']));
//         print(Text(user['role']));

//         // if(Text(user['name']) == "Teacher"){
//         //   if(Text(user['email']) == "kevin@teacher.ac.id"){
//         //   teacherClass = Text(user['class']).toString();
//         //   print(teacherClass);
//         // }
//         // }

//         if(Text(user['name']) == "Student"){
//           teacherClass = Text(user['class']).toString();
//           students.add(teacherClass);
//         }

//         // final userWidget = Row(
//         //   children: [
//         //     Text(user['name']),
//         //     Text(user['class']),
//         //     Text(user['email']),
//         //     Text(user['role']),
//         //   ],
//         // );
//         // userWidgets.add(userWidget);
//       }
//     }

//     return ListView(
//       children: userWidgets,
//       );
//   }
// ),