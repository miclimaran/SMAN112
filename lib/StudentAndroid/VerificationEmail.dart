import 'package:flutter/material.dart';
import 'VerificationOTP.dart';

class VerificationEmailTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verification Email',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => VerificationEmail());
          case '/VerificationOTP':
            return MaterialPageRoute(builder: (_) => VerificationOTP());
          // Add more cases for other routes if needed
          default:
            return null;
        }
      },
    );
  }
}

class VerificationEmail extends StatelessWidget {
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
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Masukan Email Anda',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8F8F8F),
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xFF8F8F8F), // Change label text color here
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: <Widget>[
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerificationOTP()),
                    );
                },
                child: Text(
                  'Kirim OTP',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6491EE),

                  elevation: 5,
                ),
              ),
              SizedBox(height: 20.0), // Add some bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
