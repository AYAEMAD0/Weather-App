import 'package:flutter/material.dart';
import '../api/api_response.dart';
import '../api/api_service.dart';
import '../core/app_color.dart';
import 'custom_info_card.dart';

class CustomCardSunrise extends StatelessWidget {
  const CustomCardSunrise ({super.key, required this.data});
  final ApiResponse data;
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomInfoCard(title: 'Sunrise', value: data.sunrise ?? ''),
                const SizedBox(height: 10),
                CustomInfoCard(title: 'Sunset', value: data.sunset ?? ''),
              ],
            ),
          );
  }
}
