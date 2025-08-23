import 'package:flutter/material.dart';
import '../core/app_color.dart';

class CustomHourHomeEnd extends StatelessWidget {
  const CustomHourHomeEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '19°',
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  'assets/images/onboarding.png',
                  height: 60,
                ),
                SizedBox(height: 10,),
                Text(
                  '15.00',
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
                       ),
           );




  }
}
