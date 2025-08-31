import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../core/app_color.dart';
import '../data/cubit/get_weather_astro/get_weather_astro_cubit.dart';
import 'custom_info_card.dart';

class CustomCardSunrise extends StatelessWidget {
  const CustomCardSunrise({super.key, required this.position});
  final Position position;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherAstroCubit, GetWeatherAstroState>(
      builder: (context, state) {
          if (state is GetWeatherAstroSuccess ){
          final data = state.data;
          return Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomInfoCard(title: 'Sunrise', value: data.sunrise ?? ''),
                const SizedBox(height: 10),
                CustomInfoCard(title: 'Sunset', value: data.sunset ?? ''),
              ],
            ),
          );
        } else if (state is GetWeatherAstroFailure) {
          return Text("Error: ${state.message}",
              style: const TextStyle(color: AppColor.colorWhite));
        }
        return const SizedBox();
      },
    );
  }
}
