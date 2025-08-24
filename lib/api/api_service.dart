import 'package:dio/dio.dart';
import 'package:weather/api/api_response.dart';

class ApiService {
  final Dio dio = Dio();

  Future<ApiResponse> getWeather(double lat, double lon) async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "$lat,$lon",
        "days": 1,
      },
    );

    var result = response.data["forecast"]["forecastday"] as List;
    var today = result[0];
    return ApiResponse.fromJson(today);
  }

  Future<ApiResponse> getWeatherByCity(String city) async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": city,
        "days": 1,
      },
    );
    var result = response.data["forecast"]["forecastday"] as List;
    var today = result[0];
    return ApiResponse.fromJson(today);
  }


  Future<List<ApiResponse>> daysWeather(double lat, double lon) async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "$lat,$lon",
        "days": 7,
      },
    );

    var result = response.data["forecast"]["forecastday"] as List;
    return result.map((e) => ApiResponse.fromDay(e)).toList();
  }

  Future<List<ApiResponse>> hoursWeather(double lat, double lon) async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "$lat,$lon",
        "days": 1,
      },
    );

    var result = response.data["forecast"]["forecastday"][0]["hour"] as List;
    DateTime now = DateTime.now();
    result = result.where((e) {
      final time = DateTime.parse(e["time"]);
      return time.isAfter(now) || time.hour == now.hour;
    }).toList();

    return result.map((e) => ApiResponse.fromHour(e)).toList();
  }

  Future<ApiResponse> astroWeather(double lat, double lon) async {
    Response response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json',
      queryParameters: {
        "key": "0b7c23d0a7ca4f61a2e112846252308",
        "q": "$lat,$lon",
        "days": 1,
      },
    );

    var result = response.data["forecast"]["forecastday"][0]["astro"];
    return ApiResponse.fromastro(result);
  }
}
