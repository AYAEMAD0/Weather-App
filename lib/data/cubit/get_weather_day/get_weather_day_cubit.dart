import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/weather_response.dart';
import '../../service/api_service.dart';
part 'get_weather_day_state.dart';

class GetWeatherDayCubit extends Cubit<GetWeatherDayState> {
  final ApiService apiService;
  GetWeatherDayCubit({required this.apiService}) : super(GetWeatherDayInitial());
  Future<void> getDaysWeather(double lat, double lon) async {
    emit(GetWeatherDayLoading());
    try {
      final days = await apiService.getDaysWeather(lat, lon);
      emit(GetWeatherDaySuccess(data: days));
    } catch (e) {
      emit(GetWeatherDayFailure(message: e.toString()));
    }
  }
}
