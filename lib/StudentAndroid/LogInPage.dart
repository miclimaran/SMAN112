// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sekolah_app/UserAuth/firebase_auth_services.dart';
// import '../Admin Android/HomepageAdmin.dart';
// import '../Teacher Android/HomepageTeacher.dart';
// import 'VerificationEmail.dart';
// import 'Homepage2.dart';

// class LoginApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LoginPage(),
//         '/verificationEmail': (context) => VerificationEmail(),
//         '/Homepage2': (context) => Homepage2(),
//         '/HomepageTeacher': (context) => HomepageTeacher(),
//         '/HomepageAdmin': (context) => HomepageAdmin(),
//       },
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   bool _rememberMe = false;

//   bool _isSigning = false;
//   final FirebaseAuthService _auth = FirebaseAuthService();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
  
//   final TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(height: 20.0),
//               Image.asset(
//                 'images/SMAN112Logo.png',
//                 height: 150,
//                 width: 150,
//               ),
//               SizedBox(height: 20.0),
//               Text(
//                 'Log In to SMAN 112',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: 'Montserrat',
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Checkbox(
//                     value: _rememberMe,
//                     onChanged: (bool? value) {
//                       setState(() {
//                         _rememberMe = value ?? false;
//                       });
//                     },
//                   ),
//                   Text(
//                     'Remember Me',
//                     style: TextStyle(
//                       fontFamily: 'Montserrat',
//                     ),
//                   ),
//                   Spacer(),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/verificationEmail');
//                       print('Forgot Password button pressed');
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         fontFamily: 'Montserrat',
//                         color: Color(0xFF8F8F8F),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   String enteredText = textController.text;
//                   _signIn();
//                 // if (enteredText == 'S') {
//                 //   print('Student');
//                 //   Navigator.pushNamed(context, '/Homepage2');
//                 // } else if (enteredText == 'T') {
//                 //   print('Teacher');
//                 //   Navigator.pushNamed(context, '/HomepageTeacher');
//                 // } else if (enteredText == 'A') {
//                 //   print('Admin');
//                 //   Navigator.pushNamed(context, '/HomepageAdmin');
//                 // }else {
//                 // }
//                 },
//                 child: Text(
//                   'Log In',
//                   style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF6491EE),
//                   onPrimary: Colors.white,
//                   elevation: 5,
//                 ),
//               ),
//               SizedBox(height: 20.0), 
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String emailName = '';
//   String emailType = '';

//   void _signIn() async {
//     setState(() {
//       _isSigning = true;
//     });

//     String email = _emailController.text;
//     String password = _passwordController.text;

//     User? user = await _auth.signInWithEmailAndPassword(email, password);

//     setState(() {
//       _isSigning = false;
//     });

//     if (user != null) {
//       getEmailName(email);
//       getRoleFromEmail(email);
//       if(emailType == 'student'){
//         showToast(message: "Welcome Student " + emailName);
//       }
//       else if(emailType == 'teacher'){
//         showToast(message: "Welcome Teacher " + emailName);
//       }
//       else if(emailType == 'admin'){
//         showToast(message: "Welcome Admin " + emailName);
//       }
//     } else {
//       showToast(message: "some error occured");
//     }
//   }

//     void getRoleFromEmail(String email) {
//     if (email.endsWith('@student.ac.id')) {
//       emailType = 'student';
//       Navigator.pushNamed(context, "/Homepage2", arguments: emailName);

//     } else if (email.endsWith('@teacher.ac.id')) {
//       emailType = 'teacher';
//       Navigator.pushNamed(context, "/HomepageTeacher", arguments: emailName);

//     } else if (email.endsWith('@admin.ac.id')) {
//       emailType = 'admin';
//       Navigator.pushNamed(context, "/HomepageAdmin", arguments: emailName);

//     } 
//   }

// String getEmailName(String email) {
//   List<String> parts = email.split('@');
  

//   // Check if the email has a valid format
//   if (parts.length >= 2) {
//     emailName = parts[0];
//     return emailName;
//   } else {
//     // Handle invalid email format
//     return 'InvalidEmailFormat';
//   }
// }

// }




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sekolah_app/UserAuth/firebase_auth_services.dart';
import '../Admin Android/HomepageAdmin.dart';
import '../Teacher Android/HomepageTeacher.dart';
import 'VerificationEmail.dart';
import 'Homepage2.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/verificationEmail': (context) => VerificationEmail(),
        '/Homepage2': (context) => Homepage2(),
        '/HomepageTeacher': (context) => HomepageTeacher(),
        '/HomepageAdmin': (context) => HomepageAdmin(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

String emailName = '';


class LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Image.asset(
                'images/SMAN112Logo.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20.0),
              Text(
                'Log In to SMAN 112',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'Remember Me',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/verificationEmail');
                      print('Forgot Password button pressed');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF8F8F8F),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _signIn();
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6491EE),
                  onPrimary: Colors.white,
                  elevation: 5,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }


  String emailType = '';

  void _signIn() async {
    setState(() {
      _isSigning = true;
    }); 
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      getNameEmail(email);
      getRoleFromEmail(email);
      emailName = email;
      // Pass the email as an argument when navigating to the next page
      // if (emailType == 'student') {
      //   Navigator.pushNamed(context, "/Homepage2", arguments: emailName);
      // } else if (emailType == 'teacher') {
      //   Navigator.pushNamed(context, "/HomepageTeacher", arguments: emailName);
      // } else if (emailType == 'admin') {
      //   Navigator.pushNamed(context, "/HomepageAdmin", arguments: emailName);
      // }
    } 
  }

void getRoleFromEmail(String email) {
  if (email.endsWith('@student.ac.id')) {
    emailType = 'student';
    Navigator.pushNamed(context, "/Homepage2", arguments: emailName);
  } else if (email.endsWith('@teacher.ac.id')) {
    emailType = 'teacher';
    Navigator.pushNamed(context, "/HomepageTeacher", arguments: emailName);
  } else if (email.endsWith('@admin.ac.id')) {
    emailType = 'admin';
    Navigator.pushNamed(context, "/HomepageAdmin", arguments: emailName);
  } else {
      showToast(message: "Some error occurred");
    }
}


String getNameEmail(email) {
  List<String> parts = email.split('@');

  // Check if the email has a valid format
  if (parts.length >= 2) {
    String namePart = parts[0];
    List<String> nameParts = namePart.split(' ');

    // Capitalize each part of the name
    nameParts = nameParts.map((part) => capitalize(part)).toList();

    // Join the parts to form the full name
    String emailName = nameParts.join(' ');
    return emailName;
  } else {
    // Handle invalid email format
    return 'InvalidEmailFormat';
  }
}

// Capitalize the first letter of a string
String capitalize(String input) {
  return "${input[0].toUpperCase()}${input.substring(1)}";
}





}

class UserData {
  String email = emailName;

}




