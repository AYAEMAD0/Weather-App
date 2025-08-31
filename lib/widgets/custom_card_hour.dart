import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../core/app_color.dart';
import '../data/cubit/get_weather_hour/get_weather_hour_cubit.dart';

class CustomCardHour extends StatelessWidget {
  const CustomCardHour({super.key, required this.position});
  final Position position;
  @override
  Widget build(BuildContext context) {
    final todayDate = DateFormat('MMMM d').format(DateTime.now());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        gradient: AppColor.gradientS3CCenter,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    color: AppColor.colorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  todayDate,
                  style: const TextStyle(
                    color: AppColor.colorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Divider(color: AppColor.colorDivider, thickness: 1.3),
          const SizedBox(height: 3),
          BlocBuilder<GetWeatherHourCubit, GetWeatherHourState>(
            builder: (context, state) {
              if (state is GetWeatherHourLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColor.colorWhite),
                );
              } else if (state is GetWeatherHourSuccess) {
                final dataList = state.hours;
                return SizedBox(
                  height: 130,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: dataList.map((data) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${data.temp}°',
                                style: const TextStyle(
                                  color: AppColor.colorWhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CachedNetworkImage(
                                imageUrl: data.image!,
                                height: 65,
                                width: 65,
                                fit: BoxFit.contain,
                                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColor.colorWhite,)),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error, size: 20, color: Colors.red),
                                fadeInDuration: Duration(milliseconds: 500),
                              ),

                              Text(
                                data.date!,
                                style: const TextStyle(
                                  color: AppColor.colorWhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else if (state is GetWeatherHourFailure) {
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
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
