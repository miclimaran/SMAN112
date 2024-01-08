import 'dart:async';
import 'package:flutter/material.dart';
import 'LogInPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginApp(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          alignment: Alignment(0.0, 0.0),
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/SMAN112Logo.png'),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: screenWidth * 0.5,
                height: screenHeight * 0.2,
                child: Text(
                  'SMAN 112',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
