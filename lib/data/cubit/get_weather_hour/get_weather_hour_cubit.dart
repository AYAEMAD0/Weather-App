import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_response.dart';
import '../../service/api_service.dart';
part 'get_weather_hour_state.dart';

class GetWeatherHourCubit extends Cubit<GetWeatherHourState> {
  final ApiService apiService;
  GetWeatherHourCubit({required this.apiService}) : super(GetWeatherHourInitial());

  Future<void> getHoursWeather(double lat, double lon) async {
    emit(GetWeatherHourLoading());
    try {
      final hours = await apiService.getHoursWeather(lat, lon);
      emit(GetWeatherHourSuccess(hours: hours));
    } catch (e) {
      emit(GetWeatherHourFailure(message: e.toString()));
    }
  }
}
