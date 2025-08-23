import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/app_color.dart';

import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static final String splash_routeName='splash';

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
    Navigator.pushReplacementNamed(context, OnboardingScreen.onboarding_routeName);
  },
);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColor.gradient1

        ),
        child:Lottie.asset('assets/animations/Weather.json'),),

    );
  }
}

