import 'package:intl/intl.dart';

class ApiResponse{
  final String? image;
  final String? condition;
  final int? temp;
  final int? minTemp;
  final int? maxTemp;
  final String? date;
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moon_phase;
  final int? moon_illumination;

  ApiResponse({
     this.image,
     this.condition,
     this.temp,
     this.minTemp,
     this.maxTemp,
     this.date,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moon_phase,
    this.moon_illumination,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json){
    String iconUrl = json["day"]["condition"]["icon"];
    if (iconUrl.startsWith("//")) {
      iconUrl = "https:$iconUrl";
    }

    return ApiResponse(
      //image: json["day"]["condition"]["icon"],
      image: iconUrl,
      condition: json["day"]["condition"]["text"],
      temp: (json["day"]["avgtemp_c"] as num).toInt(),
      minTemp: (json["day"]["mintemp_c"] as num).toInt(),
      maxTemp: (json["day"]["maxtemp_c"] as num).toInt(),
    );
  }
  factory ApiResponse.fromHour(Map<String, dynamic> json) {
    //format package intl
    //"2025-08-23 05:00"
    String rawTime = json["time"];
    DateTime parsedTime = DateTime.parse(rawTime);  //parsing DataTime
    String formattedTime = DateFormat('HH:mm').format(parsedTime);  //change format

    return ApiResponse(
      image: json["condition"]["icon"],
      temp: (json["temp_c"] as num).toInt(),
      date: formattedTime,
    );
  }

  factory ApiResponse.fromDay(Map<String, dynamic> json){
    String rawDate = json["date"]; // e.g. "2025-08-23"
    DateTime parsedDate = DateTime.parse(rawDate);
    String formattedDate = DateFormat('dd/MM').format(parsedDate);
    return ApiResponse(
      image: json["day"]["condition"]["icon"],
      temp: (json["day"]["avgtemp_c"] as num).toInt(),
      condition: json["day"]["condition"]["text"],
      date: formattedDate,
    );
  }

  factory ApiResponse.fromastro(Map<String, dynamic> json){
    return ApiResponse(
      sunrise:json["sunrise"] ,
      sunset:json["sunset"],
      moonrise:json["moonrise"],
      moonset:json["moonset"],
      moon_phase:json["moon_phase"],
      moon_illumination:json["moon_illumination"],
    );
  }
}