import 'package:dio/dio.dart';
import 'package:weather/api/api_response.dart';

class ApiService {
  final Dio dio = Dio();

  Future<ApiResponse> currentWeather() async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "London",
        "days": 1,
      },
    );

    var result = response.data["forecast"]["forecastday"] as List;
    var today = result[0];
    return ApiResponse.fromJson(today);
  }

  Future<List<ApiResponse>> daysWeather() async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "Cairo",
        "days": 7,
      },
    );

    var result = response.data["forecast"]["forecastday"] as List;
    return result.map((e) => ApiResponse.fromDay(e)).toList();
  }

  Future<List<ApiResponse>> hoursWeather() async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "Cairo",
        "days": 1,
      },
    );

    var result = response.data["forecast"]["forecastday"][0]["hour"] as List;
    return result.map((e) => ApiResponse.fromHour(e)).toList();
  }


  Future<ApiResponse> astroWeather() async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "Cairo",
        "days": 1,
      },
    );

    var result = response.data["forecast"]["forecastday"][0]["astro"];
    return ApiResponse.fromastro(result);
  }

}
