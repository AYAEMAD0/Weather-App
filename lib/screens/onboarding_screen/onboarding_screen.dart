import 'package:flutter/material.dart';

import '../../core/color_app.dart';
import '../home_screen/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static final onboarding_id = 'onboarding';



@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/onboarding.png',
                  height: 200,
                  //  width: 428,
                ),
                Text(
                  'Weather',
                  style: TextStyle(
                    color: ColorApp.color_white,
                    fontSize: 64,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ForeCasts',
                  style: TextStyle(
                    color: ColorApp.color_yellow,
                    fontSize: 64,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 53),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.home_id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorApp.color_yellow,
                    minimumSize: Size(250, 50),
                    //padding: EdgeInsets.all(19),
                  ),
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
