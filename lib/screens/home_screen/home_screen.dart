import 'package:flutter/material.dart';
import 'package:weather/api/api_response.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/widgets/custom_card_home_end.dart';

import '../../core/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String home_routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ApiResponse> value;
  @override
  void initState() {
    value = ApiService().currentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColor.gradient1),
      child: SafeArea(
        child: FutureBuilder(
          future: value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: AppColor.color_white),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(
                    color: AppColor.color_white,
                    fontSize: 30,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return Column(
                children: [
                  Image.network(
                    data.image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                   filterQuality: FilterQuality.high,
                    ),
                  Text(
                    '${data.temp}°',
                    style: TextStyle(
                      color: AppColor.color_white,
                      fontSize: 55,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                 SizedBox(height: 10,),
                  Text(
                    data.condition!,
                    style: TextStyle(
                      color: AppColor.color_white,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Max: ${data.maxTemp}°',
                        style: TextStyle(
                          color: AppColor.color_white,
                          fontSize: 23,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        'Min:${data.minTemp}°',
                        style: TextStyle(
                          color: AppColor.color_white,
                          fontSize: 23,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                 SizedBox(height: 15),
                  Image.asset('assets/images/house.png', height: 140),
                  Expanded(child: CustomCardHomeEnd()),
                ],
              );
            } else {
              return const Center(
                child: Text(
                  "No data available",
                  style: TextStyle(color: AppColor.color_white, fontSize: 24),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
