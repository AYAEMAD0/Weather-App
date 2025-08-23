import 'package:flutter/material.dart';

import '../../core/app_color.dart';
import '../home_screen/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static final onboarding_routeName = 'onboarding';


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:AppColor.gradient1
        ),

        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/onboarding.png',
                  height: 300,
                ),
                Text(
                  'Weather',
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ForeCasts',
                  style: TextStyle(
                    color: AppColor.color_yellow,
                    fontSize: 58,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 53),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.home_routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.color_yellow,
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
