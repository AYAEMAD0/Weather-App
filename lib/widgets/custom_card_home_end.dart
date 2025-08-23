import 'package:flutter/material.dart';
import 'package:weather/widgets/custom_hour_home_end.dart';
import '../core/app_color.dart';

class CustomCardHomeEnd extends StatelessWidget {
  const CustomCardHomeEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppColor.gradientS2C,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      color: AppColor.color_white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'July, 21',
                    style: TextStyle(
                      color: AppColor.color_white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Divider(color: AppColor.color_divider),
            SizedBox(height: 5,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomHourHomeEnd(),
          CustomHourHomeEnd(),
          CustomHourHomeEnd(),
          CustomHourHomeEnd(),

        ])
          ],
        ),
      ),
    );
  }
}
