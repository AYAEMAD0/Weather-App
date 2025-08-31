part of 'get_weather_hour_cubit.dart';

sealed class GetWeatherHourState {}

final class GetWeatherHourInitial extends GetWeatherHourState {}
final class GetWeatherHourLoading extends GetWeatherHourState {}
final class GetWeatherHourSuccess extends GetWeatherHourState {
  final List<WeatherResponse> hours;
  GetWeatherHourSuccess({required this.hours});
}
final class GetWeatherHourFailure extends GetWeatherHourState {
  String message;
  GetWeatherHourFailure({required this.message});
}