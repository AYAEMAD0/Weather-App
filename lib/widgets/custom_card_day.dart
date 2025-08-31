import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/data/cubit/get_weather_day/get_weather_day_cubit.dart';
import '../core/app_color.dart';

class CustomCardDay extends StatelessWidget {
  const CustomCardDay({super.key, required this.position});
  final Position position;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<GetWeatherDayCubit, GetWeatherDayState>(
        builder: (context, state) {
            if (state is GetWeatherDaySuccess) {
            final dataList = state.data;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: dataList.map((data) {
                  return Container(
                    width: 90,
                    height: 180,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: AppColor.gradientS3C1,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${data.date}',
                          style: const TextStyle(
                            color: AppColor.colorWhite,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl: data.image!,
                          height: 50,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColor.colorWhite,)),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error, size: 20, color: Colors.red),
                          fadeInDuration: Duration(milliseconds: 500),
                        ),
                        Text(
                          '${data.temp}°',
                          style: const TextStyle(
                            color: AppColor.colorWhite,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          } else if (state is GetWeatherDayFailure) {
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
            return SizedBox();
          }
        },
      ),
    );
  }
}
