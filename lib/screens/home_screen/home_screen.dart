import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/core/app_asset.dart';
import 'package:weather/widgets/custom_card_hour.dart';
import '../../core/app_color.dart';
import '../../data/cubit/get_weather/get_weather_cubit.dart';
import '../../data/cubit/get_weather/get_weather_state.dart';
import '../../data/cubit/get_weather_hour/get_weather_hour_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.position});
  final Position position;
  static const String homeRouteName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? cityName;
  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.position.latitude,
        widget.position.longitude,
      );

      if (placemarks.isNotEmpty) {
        cityName = placemarks.first.locality;
      }
      context.read<GetWeatherCubit>().getWeather(
        widget.position.latitude,
        widget.position.longitude,
      );
      context.read<GetWeatherHourCubit>().getHoursWeather(
        widget.position.latitude,
        widget.position.longitude,
      );
    } catch (e) {
      ("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColor.gradient1),
      child: SafeArea(
        child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            if (state is GetWeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColor.colorWhite),
              );
            } else if (state is GetWeatherSuccess) {
              final data = state.data;
              return Column(
                children: [
                  SizedBox(height: 5),
                  CachedNetworkImage(
                    imageUrl: data.image!,
                    width: 150,
                    height: 140,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColor.colorWhite,)),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, size: 30, color: Colors.red),
                    fadeInDuration: Duration(milliseconds: 500),
                  ),
                  if (cityName != null)
                    Text(
                      cityName!,
                      style: const TextStyle(
                        color: AppColor.colorWhite,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    '${data.temp}°',
                    style: const TextStyle(
                      color: AppColor.colorWhite,
                      fontSize: 45,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    data.condition!,
                    style: const TextStyle(
                      color: AppColor.colorWhite,
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
                          color: AppColor.colorWhite,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 25),
                      Text(
                        'Min: ${data.minTemp}°',
                        style: const TextStyle(
                          color: AppColor.colorWhite,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Image.asset(AppAsset.homeImage, height: 140),
                  Expanded(child: CustomCardHour(position: widget.position)),
                ],
              );
            } else if (state is GetWeatherFailure) {
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
                  "No data available",
                  style: TextStyle(color: AppColor.colorWhite, fontSize: 24),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
