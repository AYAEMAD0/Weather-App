part of 'get_weather_day_cubit.dart';

sealed class GetWeatherDayState {}

final class GetWeatherDayInitial extends GetWeatherDayState {}
final class GetWeatherDayLoading extends GetWeatherDayState {}
final class GetWeatherDaySuccess extends GetWeatherDayState {
  final List<WeatherResponse> data;
  GetWeatherDaySuccess({required this.data});
}
final class GetWeatherDayFailure extends GetWeatherDayState {
  String message;
  GetWeatherDayFailure({required this.message});
}