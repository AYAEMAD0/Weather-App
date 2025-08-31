import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/api_service.dart';

part 'get_weather_astro_state.dart';

class GetWeatherAstroCubit extends Cubit<GetWeatherAstroState> {
  final ApiService apiService;
  GetWeatherAstroCubit({required this.apiService}) : super(GetWeatherAstroInitial());
  Future<void> getAstroWeather(double lat, double lon) async {
    emit(GetWeatherAstroLoading());
    try {
      final astro = await apiService.getAstroWeather(lat, lon);
      emit(GetWeatherAstroSuccess(data: astro));
    } catch (e) {
      emit(GetWeatherAstroFailure(message: e.toString()));
    }
  }
}
