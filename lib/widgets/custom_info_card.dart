import 'package:flutter/material.dart';
import '../core/app_color.dart';

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isMoon;
  final String? title2;
  final String? value2;

  const CustomInfoCard({
    super.key,
    required this.title,
    required this.value,
    this.isMoon = false,
    this.title2,
    this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: AppColor.gradientS3CCenter,
        borderRadius: BorderRadius.circular(22),
      ),
      child: isMoon
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$title\n$value',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColor.color_white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '$title2\n$value2',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColor.color_white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          : Text(
              '$title\n$value',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColor.color_white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }
}
