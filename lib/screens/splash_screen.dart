import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2ECC40), // hijau cerah dari desain
      body: Center(
        child: Image.asset(
          'assets/Logo.png', // pastikan file ini sesuai dengan desain yang kamu upload
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
