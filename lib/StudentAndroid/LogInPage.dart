import 'package:flutter/material.dart';
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

class LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final TextEditingController textController = TextEditingController();

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
                controller: textController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
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
                  String enteredText = textController.text;
                if (enteredText == 'S') {
                  print('Student');
                  Navigator.pushNamed(context, '/Homepage2');
                } else if (enteredText == 'T') {
                  print('Teacher');
                  Navigator.pushNamed(context, '/HomepageTeacher');
                } else if (enteredText == 'A') {
                  print('Admin');
                  Navigator.pushNamed(context, '/HomepageAdmin');
                }else {
                }
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
}
