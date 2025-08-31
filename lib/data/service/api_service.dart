import 'package:dio/dio.dart';
import 'package:weather/data/models/weather_response.dart';

class ApiService {
  final String apiKey = "0b7c23d0a7ca4f61a2e112846252308";
  final String baseUrl = "http://api.weatherapi.com/v1/forecast.json";

  Dio _createDio({required Map<String, dynamic> params}) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      queryParameters: params,
    );
    return Dio(options);
  }

  Future<WeatherResponse> getWeather(double lat, double lon) async {
    final dio = _createDio(params: {"key": apiKey, "q": "$lat,$lon", "days": 1});
    final response = await dio.get("");
    final today = response.data["forecast"]["forecastday"][0];
    return WeatherResponse.fromJson(today);
  }

  Future<List<WeatherResponse>> getHoursWeather(double lat, double lon) async {
    final dio = _createDio(params: {"key": apiKey, "q": "$lat,$lon", "days": 1});
    final response = await dio.get("");
    var hours = response.data["forecast"]["forecastday"][0]["hour"] as List;

    final now = DateTime.now();
    hours = hours.where((e) {
      final time = DateTime.parse(e["time"]);
      return time.isAfter(now) || time.hour == now.hour;
    }).toList();

    return hours.map((e) => WeatherResponse.fromHour(e)).toList();
  }

  Future<WeatherResponse> getWeatherByCity(String city) async {
    final dio = _createDio(params: {"key": apiKey, "q": city, "days": 1});
    final response = await dio.get("");
    final today = response.data["forecast"]["forecastday"][0];
    return WeatherResponse.fromJson(today);
  }

  Future<List<WeatherResponse>> getDaysWeather(double lat, double lon) async {
    final dio = _createDio(params: {"key": apiKey, "q": "$lat,$lon", "days": 7});
    final response = await dio.get("");
    final result = response.data["forecast"]["forecastday"] as List;
    return result.map((e) => WeatherResponse.fromDay(e)).toList();
  }

  Future<WeatherResponse> getAstroWeather(double lat, double lon) async {
    final dio = _createDio(params: {"key": apiKey, "q": "$lat,$lon", "days": 1});
    final response = await dio.get("");
    final astro = response.data["forecast"]["forecastday"][0]["astro"];
    return WeatherResponse.fromastro(astro);
  }
}





// import 'package:dio/dio.dart';
// import 'package:weather/models/weather_response.dart';
//
// class ApiService {
//   late Dio dio;
//   final String apiKey = "0b7c23d0a7ca4f61a2e112846252308";
//   final String baseUrl = "http://api.weatherapi.com/v1/forecast.json";
//
//   Future<WeatherResponse> getWeather(double lat, double lon) async {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       queryParameters: {"key": apiKey, "q": "$lat,$lon", "days": 1},
//     );
//     dio = Dio(options);
//     Response response = await dio.get("");
//     var today = response.data["forecast"]["forecastday"][0];
//     return WeatherResponse.fromJson(today);
//   }
//
//   Future<List<WeatherResponse>> getHoursWeather(double lat, double lon) async {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       queryParameters: {"key": apiKey, "q": "$lat,$lon", "days": 1},
//     );
//     dio = Dio(options);
//     Response response = await dio.get("");
//     var result = response.data["forecast"]["forecastday"][0]["hour"] as List;
//     DateTime now = DateTime.now();
//     result = result.where((e) {
//       final time = DateTime.parse(e["time"]);
//       return time.isAfter(now) || time.hour == now.hour;
//     }).toList();
//
//     return result.map((e) => WeatherResponse.fromHour(e)).toList();
//   }
//
//   Future<WeatherResponse> getWeatherByCity(String city) async {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       queryParameters: {"key": apiKey, "q": city, "days": 1},
//     );
//     dio = Dio(options);
//     Response response = await dio.get("");
//     var result = response.data["forecast"]["forecastday"] as List;
//     var today = result[0];
//     return WeatherResponse.fromJson(today);
//   }
//
//   Future<List<WeatherResponse>> daysWeather(double lat, double lon) async {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       queryParameters: {"key": apiKey, "q": "$lat,$lon", "days": 1},
//     );
//     dio = Dio(options);
//     Response response = await dio.get("");
//     var result = response.data["forecast"]["forecastday"] as List;
//     return result.map((e) => WeatherResponse.fromDay(e)).toList();
//   }
//
//   Future<WeatherResponse> astroWeather(double lat, double lon) async {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseUrl,
//       queryParameters: {"key": apiKey, "q": "$lat,$lon", "days": 1},
//     );
//     dio = Dio(options);
//     Response response = await dio.get("");
//     var result = response.data["forecast"]["forecastday"][0]["astro"];
//     return WeatherResponse.fromastro(result);
//   }
// }


// class ApiService {
//   final Dio dio = Dio();
//
//   Future<WeatherResponse> getWeather(double lat, double lon) async {
//     Response response = await dio.get(
//       'http://api.weatherapi.com/v1/forecast.json',
//       queryParameters: {
//         "key": "0b7c23d0a7ca4f61a2e112846252308",
//         "q": "$lat,$lon",
//         "days": 1,
//       },
//     );
//
//     var result = response.data["forecast"]["forecastday"] as List;
//     var today = result[0];
//     return WeatherResponse.fromJson(today);
//   }
//
//   Future<WeatherResponse> getWeatherByCity(String city) async {
//     Response response = await dio.get(
//       'http://api.weatherapi.com/v1/forecast.json',
//       queryParameters: {
//         "key": "0b7c23d0a7ca4f61a2e112846252308",
//         "q": city,
//         "days": 1,
//       },
//     );
//     var result = response.data["forecast"]["forecastday"] as List;
//     var today = result[0];
//     return WeatherResponse.fromJson(today);
//   }
//
//
//   Future<List<WeatherResponse>> daysWeather(double lat, double lon) async {
//     Response response = await dio.get(
//       'http://api.weatherapi.com/v1/forecast.json',
//       queryParameters: {
//         "key": "0b7c23d0a7ca4f61a2e112846252308",
//         "q": "$lat,$lon",
//         "days": 7,
//       },
//     );
//
//     var result = response.data["forecast"]["forecastday"] as List;
//     return result.map((e) => WeatherResponse.fromDay(e)).toList();
//   }
//
//   Future<List<WeatherResponse>> hoursWeather(double lat, double lon) async {
//     Response response = await dio.get(
//       'http://api.weatherapi.com/v1/forecast.json',
//       queryParameters: {
//         "key": "0b7c23d0a7ca4f61a2e112846252308",
//         "q": "$lat,$lon",
//         "days": 1,
//       },
//     );
//
//     var result = response.data["forecast"]["forecastday"][0]["hour"] as List;
//     DateTime now = DateTime.now();
//     result = result.where((e) {
//       final time = DateTime.parse(e["time"]);
//       return time.isAfter(now) || time.hour == now.hour;
//     }).toList();
//
//     return result.map((e) => WeatherResponse.fromHour(e)).toList();
//   }
//
//   Future<WeatherResponse> astroWeather(double lat, double lon) async {
//     Response response = await dio.get(
//       'http://api.weatherapi.com/v1/forecast.json',
//       queryParameters: {
//         "key": "0b7c23d0a7ca4f61a2e112846252308",
//         "q": "$lat,$lon",
//         "days": 1,
//       },
//     );
//
//     var result = response.data["forecast"]["forecastday"][0]["astro"];
//     return WeatherResponse.fromastro(result);
//   }
// }
