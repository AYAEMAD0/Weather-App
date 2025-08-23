import 'package:flutter/material.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/widgets/custom_card_day.dart';
import 'package:weather/widgets/custom_card_moon.dart';
import '../../api/api_response.dart';
import '../../core/app_color.dart';
import '../../widgets/custom_card_sunrise.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  static final String details_routeName = 'details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<Map<String, dynamic>> value;

  @override
  void initState() {
    value = _loadData();
    super.initState();
  }

  Future<Map<String, dynamic>> _loadData() async {
    final days = ApiService().daysWeather();
    final astro = ApiService().astroWeather();
    final results = await Future.wait([days, astro]);
    return {
      "days": results[0],
      "astro": results[1],
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<Map<String, dynamic>>(
        future: value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.color_white),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}",
                style: const TextStyle(color: AppColor.color_white, fontSize: 30),
              ),
            );
          } else if (snapshot.hasData) {
            final daysData = snapshot.data!["days"] as List<ApiResponse>;
            final astroData = snapshot.data!["astro"] as ApiResponse;

            return Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  '7-Days Forecasts',
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 23,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),

                // 7 Days Forecast
                CustomCardDay(dataList: daysData),
                // Sunrise
                CustomCardSunrise (data: astroData),
                const SizedBox(height: 10),
                // Moon
                CustomCardMoon(data: astroData),
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
    );
  }
}

