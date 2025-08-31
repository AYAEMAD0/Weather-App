import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/widgets/custom_text_field.dart';
import '../../core/app_color.dart';
import '../../data/cubit/get_weather_by_city/get_weather_by_city_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String searchRouteName = 'search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String? city;
  Timer? _debounce;

  void onSearchChanged(String val) {
    city = val;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (city != null && city!.isNotEmpty) {
        context.read<GetWeatherByCityCubit>().getWeatherByCity(city!);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
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
                  color: AppColor.colorWhite,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: searchController,
              onChang: onSearchChanged,
            ),
            const SizedBox(height: 40),
            BlocBuilder<GetWeatherByCityCubit, GetWeatherByCityState>(
              builder: (context, state) {
                if (state is GetWeatherByCityLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.colorWhite,
                    ),
                  );
                } else if (state is GetWeatherByCitySuccess) {
                  final weather = state.data;
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
                                  color: AppColor.colorWhite,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Condition: ${weather.condition}",
                                style: TextStyle(
                                  color: AppColor.colorWhite,
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
                } else if (state is GetWeatherByCityFailure) {
                  return Center(
                    child: Text(
                      "Error: ${state.message}",
                      style: const TextStyle(
                        color: AppColor.colorWhite,
                        fontSize: 20,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Start typing to search...",
                      style: TextStyle(
                        color: AppColor.colorWhite,
                        fontSize: 18,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

