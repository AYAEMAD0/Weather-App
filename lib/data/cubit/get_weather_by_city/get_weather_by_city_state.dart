part of 'get_weather_by_city_cubit.dart';

sealed class GetWeatherByCityState {}

final class GetWeatherByCityInitial extends GetWeatherByCityState {}
final class GetWeatherByCityLoading extends GetWeatherByCityState {}

final class GetWeatherByCitySuccess extends GetWeatherByCityState {
  final dynamic data;
  GetWeatherByCitySuccess({required this.data});
}

final class GetWeatherByCityFailure extends GetWeatherByCityState {
  String message;
  GetWeatherByCityFailure({required this.message});
}
