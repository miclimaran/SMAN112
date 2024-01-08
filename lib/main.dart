import 'package:flutter/material.dart';
import 'package:sekolah_app/StudentAndroid/AttendanceStudent.dart';
import 'package:sekolah_app/StudentAndroid/Homepage2.dart';
import 'package:sekolah_app/StudentAndroid/LogInPage.dart';
import 'package:sekolah_app/StudentAndroid/Schedule2.dart';
import 'package:sekolah_app/StudentAndroid/SubmitFeedback.dart';
import 'package:sekolah_app/StudentAndroid/VerificationEmail.dart';
import 'package:sekolah_app/StudentAndroid/VerificationOTP.dart';

import 'StudentAndroid/MyApp.dart';
import '../StudentAndroid/LoadPage.dart';

void main() {
  runApp(MyApp());
}


class mainapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => mainapp(),
      },
    );
  }
}