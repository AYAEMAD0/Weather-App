import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/api/api_response.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/widgets/custom_card_hour.dart';
import '../../core/app_color.dart';
import '../../widgets/location_helper.dart';
import '../../widgets/reusable_future_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String home_routeName = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ApiResponse>? value;
  String? cityName;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      Position position = await LocationHelper.getCurrentLocation();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        cityName = placemarks.first.locality;
      }
      setState(() {
        value = ApiService().getWeather(position.latitude, position.longitude);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColor.gradient1),
      child: SafeArea(
        child: value == null
            ? const Center(
                child: CircularProgressIndicator(color: AppColor.color_white),
              )
            : ReusableFutureBuilder<ApiResponse>(
                future: value!,
                onSuccess: (data) {
                  return SafeArea(
                    child: Column(
                      children: [
                        Image.network(
                          data.image!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                        if (cityName != null)
                          Text(
                            cityName!,
                            style: const TextStyle(
                              color: AppColor.color_white,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        const SizedBox(height: 10),
                        Text(
                          '${data.temp}°',
                          style: const TextStyle(
                            color: AppColor.color_white,
                            fontSize: 45,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),

                        Text(
                          data.condition!,
                          style: const TextStyle(
                            color: AppColor.color_white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Max: ${data.maxTemp}°',
                              style: const TextStyle(
                                color: AppColor.color_white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Text(
                              'Min: ${data.minTemp}°',
                              style: const TextStyle(
                                color: AppColor.color_white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Image.asset('assets/images/house.png', height: 140),
                        const Expanded(child: CustomCardHour()),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
