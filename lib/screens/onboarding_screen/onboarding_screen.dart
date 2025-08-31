import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/app_asset.dart';
import 'package:weather/data/service/api_service.dart';
import 'package:weather/screens/main_screen/main_screen.dart';
import '../../core/app_color.dart';
import '../../data/cubit/get_weather/get_weather_cubit.dart';
import '../../data/cubit/get_weather_astro/get_weather_astro_cubit.dart';
import '../../data/cubit/get_weather_by_city/get_weather_by_city_cubit.dart';
import '../../data/cubit/get_weather_day/get_weather_day_cubit.dart';
import '../../data/cubit/get_weather_hour/get_weather_hour_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const onboardingRouteName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColor.gradient1),

        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAsset.onBoardingImage, height: 300),
                Text(
                  'Weather',
                  style: TextStyle(
                    color: AppColor.colorWhite,
                    fontSize: 55,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ForeCasts',
                  style: TextStyle(
                    color: AppColor.colorYellow,
                    fontSize: 58,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 53),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider<GetWeatherCubit>(
                              create: (context) =>
                                  GetWeatherCubit(apiService: ApiService()),
                            ),
                            BlocProvider<GetWeatherHourCubit>(
                              create: (context) =>
                                  GetWeatherHourCubit(apiService: ApiService()),
                            ),
                            BlocProvider<GetWeatherByCityCubit>(
                              create: (context) => GetWeatherByCityCubit(
                                apiService: ApiService(),
                              ),
                            ),
                            BlocProvider<GetWeatherDayCubit>(
                              create: (context) => GetWeatherDayCubit(
                                apiService: ApiService(),
                              ),
                            ),
                            BlocProvider<GetWeatherAstroCubit>(
                              create: (context) => GetWeatherAstroCubit(
                                apiService: ApiService(),
                              ),
                            ),
                          ],
                          child: MainScreen(),
                        ),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.colorYellow,
                    minimumSize: Size(250, 50),
                  ),
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
