import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String splash_id='splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
@override
  void initState() {
    super.initState();
     
  
Future.delayed(
  Duration(seconds: 5),
  () {
    Navigator.pushReplacementNamed(context, OnboardingScreen.onboarding_id);
  },
);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1f264a),
              Color(0xff22284E),
              Color(0xff232a54),
              Color(0xff343575),
              Color(0xff413A8A),
              Color(0xff4E3E99),
              Color(0xff6148A6),
              Color(0xff7C4FAC),
              Color(0xff8749B1),
              Color(0xff973ead),
            ],
          ),
        ),
        child:Lottie.asset('assets/animations/Weather.json'),),

    );
  }
}

