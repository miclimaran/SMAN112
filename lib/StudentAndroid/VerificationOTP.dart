import 'package:flutter/material.dart';
import 'package:sekolah_app/StudentAndroid/Homepage2.dart';
import 'package:sekolah_app/StudentAndroid/LogInPage.dart';

void main() {
  runApp(VerificationOTPTop());
}

class VerificationOTPTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Verification Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => VerificationOTP());
          case '/LoginApp':
            return MaterialPageRoute(builder: (_) => LoginApp());
          default:
            return null;
        }
      },
    );
  }
}

class VerificationOTP extends StatelessWidget {
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
                'Verifikasi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Masukan Code yang sudah dikirimkan ke email anda',
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
                  labelText: 'OTP Code',
                  labelStyle: TextStyle(
                    color: Color(0xFF8F8F8F),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Column(
                          children: <Widget>[
                            Icon(Icons.check_circle, color: Colors.green, size: 60),
                            SizedBox(height: 10),
                            Text('Congratulation!',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        content: Text('Your OTP has been verified successfully.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginApp()),
                    );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Submit OTP',
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
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('OTP Code Sent'),
                        content: Text('The OTP code has been resent!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Saya tidak mendapatkan code! Kirim Ulang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6491EE),
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
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
