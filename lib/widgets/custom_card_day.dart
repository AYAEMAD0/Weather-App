import 'package:flutter/material.dart';

import '../api/api_response.dart';
import '../core/app_color.dart';

class CustomCardDay extends StatelessWidget {
  const CustomCardDay({super.key, required this.dataList});
  final List<ApiResponse> dataList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: dataList.map((data) {
            return Container(
              width: 90,
              height: 180,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: AppColor.gradientS3C2,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${data.date}',
                      style: const TextStyle(
                        color: AppColor.color_white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      )),
                  Image.network(data.image!, height: 50),
                  Text('${data.temp}°',
                      style: const TextStyle(
                        color: AppColor.color_white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
