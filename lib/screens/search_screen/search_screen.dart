import 'package:flutter/material.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/api/api_response.dart';
import 'package:weather/widgets/custom_text_field.dart';
import '../../core/app_color.dart';
import '../../widgets/reusable_future_builder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static final String search_routeName = 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String? city;
  Future<ApiResponse>? _futureWeather;

  void _searchCity() {
    if (city != null && city!.isNotEmpty) {
      setState(() {
        _futureWeather = ApiService().getWeatherByCity(city!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                'Search for City',
                style: TextStyle(
                  color: AppColor.color_white,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 25),
            CustomTextField(
              controller: searchController,
              onChang: (val) {
                city = val;
                if (city != null && city!.isNotEmpty) {
                  setState(() {
                    _futureWeather = ApiService().getWeatherByCity(city!);
                  });
                }
              },
            ),
            const SizedBox(height: 40),
            if (_futureWeather != null)
              ReusableFutureBuilder<ApiResponse>(
                future: _futureWeather!,
                onSuccess: (weather) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: AppColor.gradientS2C,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Temp: ${weather.temp}°",
                                style: TextStyle(
                                  color: AppColor.color_white,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Condition: ${weather.condition}",
                                style: TextStyle(
                                  color: AppColor.color_white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (weather.image != null)
                          Expanded(
                            flex: 1,
                            child: Image.network(
                              weather.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
