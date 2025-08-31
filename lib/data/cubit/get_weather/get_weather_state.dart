import 'package:weather/data/models/weather_response.dart';

sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}
final class GetWeatherLoading extends GetWeatherState {}
final class GetWeatherSuccess extends GetWeatherState {
  final WeatherResponse data;
  GetWeatherSuccess({required this.data});
}
final class GetWeatherFailure extends GetWeatherState {
  String message;
  GetWeatherFailure({required this.message});
}