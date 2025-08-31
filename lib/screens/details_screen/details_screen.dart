import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/widgets/custom_card_day.dart';
import 'package:weather/widgets/custom_card_moon.dart';
import '../../core/app_color.dart';
import '../../data/cubit/get_weather_astro/get_weather_astro_cubit.dart';
import '../../data/cubit/get_weather_day/get_weather_day_cubit.dart';
import '../../widgets/custom_card_sunrise.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.position});
  final Position position;
  static const String detailsRouteName = 'details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetWeatherDayCubit>().getDaysWeather(
      widget.position.latitude,
      widget.position.longitude,
    );

    context.read<GetWeatherAstroCubit>().getAstroWeather(
      widget.position.latitude,
      widget.position.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocSelector<GetWeatherDayCubit, GetWeatherDayState, bool>(
            selector: (dayState) => dayState is GetWeatherDayLoading,
            builder: (context, isDayLoading) {
              return BlocSelector<GetWeatherAstroCubit, GetWeatherAstroState, bool>(
                selector: (astroState) => astroState is GetWeatherAstroLoading,
                builder: (context, isAstroLoading) {
                  if (isDayLoading || isAstroLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: const Center(
                        child: CircularProgressIndicator(
                            color: AppColor.colorWhite),
                      ),
                    );
                  }

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        '7-Days Forecasts',
                        style: TextStyle(
                          color: AppColor.colorWhite,
                          fontSize: 23,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomCardDay(position: widget.position),
                      CustomCardSunrise(position: widget.position),
                      const SizedBox(height: 10),
                      CustomCardMoon(position: widget.position),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}