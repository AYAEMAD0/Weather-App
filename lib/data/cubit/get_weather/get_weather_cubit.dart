import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/api_service.dart';
import 'get_weather_state.dart';


class GetWeatherCubit extends Cubit<GetWeatherState> {
  final ApiService apiService;

  GetWeatherCubit({required this.apiService}) : super(GetWeatherInitial());

  Future<void> getWeather(double lat, double lon) async {
    emit(GetWeatherLoading());
    try {
      final weather = await apiService.getWeather(lat, lon);
      emit(GetWeatherSuccess(data: weather));
    } catch (e) {
      emit(GetWeatherFailure(message: e.toString()));
    }
  }

}
