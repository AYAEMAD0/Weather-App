part of 'get_weather_astro_cubit.dart';

sealed class GetWeatherAstroState {}

final class GetWeatherAstroInitial extends GetWeatherAstroState {}
final class GetWeatherAstroLoading extends GetWeatherAstroState {}
final class GetWeatherAstroSuccess extends GetWeatherAstroState {
  final dynamic data;
  GetWeatherAstroSuccess({required this.data});
}
final class GetWeatherAstroFailure extends GetWeatherAstroState {
  String message;
  GetWeatherAstroFailure({required this.message});
}