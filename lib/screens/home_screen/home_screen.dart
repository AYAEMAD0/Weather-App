import 'package:flutter/material.dart';
import 'package:weather/widgets/custom_card_home_end.dart';

import '../../core/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final String home_routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return
      Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: AppColor.gradient2),
          child: SafeArea(
              child:
      Column(
      children: [
        Image.asset('assets/images/onboarding.png', height: 200),
        Text(
          '19°',
          style: TextStyle(
            color: AppColor.color_white,
            fontSize: 55,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Precipitations',
          style: TextStyle(
            color: AppColor.color_white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max: 24°',
              style: TextStyle(
                color: AppColor.color_white,
                fontSize: 23,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 25),
            Text(
              'Min:18°',
              style: TextStyle(
                color: AppColor.color_white,
                fontSize: 23,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Image.asset('assets/images/house.png', height: 140),//140
        CustomCardHomeEnd(),

      ],
    )));
  }
}
