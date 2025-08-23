import 'package:flutter/material.dart';
import '../api/api_response.dart';
import 'custom_info_card.dart';

class CustomCardMoon extends StatelessWidget {
  const CustomCardMoon({super.key, required this.data});
  final ApiResponse data;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                    Expanded(child: CustomInfoCard(
                      title: 'Moonrise',
                      value: data.moonrise?? '',
                      isMoon: true,
                      title2:'Moonset',
                      value2:data.moonset ?? '',)),
                  ],),
                ),
                Expanded(
                  child: Column(children: [
                    Expanded(child: CustomInfoCard(
                      title: 'Moon_phase',
                      value: data.moon_phase ?? '',
                      isMoon: true,
                      title2:'Moon_illumination',
                      value2:data.moon_illumination.toString() ,)),
                  ],),
                ),
              ],
            ),
          );
  }
}
