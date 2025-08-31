import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../core/app_color.dart';
import '../data/cubit/get_weather_astro/get_weather_astro_cubit.dart';
import 'custom_info_card.dart';

class CustomCardMoon extends StatelessWidget {
  const CustomCardMoon({super.key, required this.position});
  final Position position;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherAstroCubit, GetWeatherAstroState>(
      builder: (context, state) {
          if (state is GetWeatherAstroSuccess){
          final data = state.data ;
          return Row(
            children: [
              Expanded(
                child: CustomInfoCard(
                  title: 'Moonrise',
                  value: data.moonrise ?? '',
                  isMoon: true,
                  title2: 'Moonset',
                  value2: data.moonset ?? '',
                ),
              ),
              Expanded(
                child: CustomInfoCard(
                  title: 'Moon_phase',
                  value: data.moonPhase ?? '',
                  isMoon: true,
                  title2: 'Moon_illumination',
                  value2: data.moonIllumination?.toString(),
                ),
              ),
            ],
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
