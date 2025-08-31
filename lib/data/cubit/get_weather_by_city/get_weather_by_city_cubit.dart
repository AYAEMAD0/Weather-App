import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/api_service.dart';
part 'get_weather_by_city_state.dart';

class GetWeatherByCityCubit extends Cubit<GetWeatherByCityState> {
  final ApiService apiService;

  GetWeatherByCityCubit({required this.apiService})
      : super(GetWeatherByCityInitial());

  Future<void> getWeatherByCity(String city) async {
    emit(GetWeatherByCityLoading());
    try {
      final weatherByCity = await apiService.getWeatherByCity(city);
      emit(GetWeatherByCitySuccess(data: weatherByCity));
    } catch (e) {
      emit(GetWeatherByCityFailure(message: e.toString()));
    }
  }
}
