import 'package:intl/intl.dart';

class WeatherResponse{
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
  final String? moonPhase;
  final int? moonIllumination;

  WeatherResponse({
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
    this.moonPhase,
    this.moonIllumination,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    String iconUrl =fixIconUrl(json["day"]["condition"]["icon"]);

    return WeatherResponse(
      image: iconUrl,
      condition: json["day"]["condition"]["text"],
      temp: (json["day"]["avgtemp_c"] as num).toInt(),
      minTemp: (json["day"]["mintemp_c"] as num).toInt(),
      maxTemp: (json["day"]["maxtemp_c"] as num).toInt(),
    );
  }


  factory WeatherResponse.fromHour(Map<String, dynamic> json) {
    // "2025-08-23 05:00"
    String rawTime = json["time"];
    DateTime parsedTime = DateTime.parse(rawTime);  // Parsing DateTime
    // Formatting time
    String formattedTime = DateFormat('HH:mm').format(parsedTime);

    // Fixing icon URL
    String iconUrl =fixIconUrl(json["condition"]["icon"])   ;

    return WeatherResponse(
      image: iconUrl,
      temp: (json["temp_c"] as num).toInt(),
      date: formattedTime,
    );
  }


  factory WeatherResponse.fromDay(Map<String, dynamic> json){
    String rawDate = json["date"]; // e.g. "2025-08-23"
    DateTime parsedDate = DateTime.parse(rawDate);
    String formattedDate = DateFormat('dd/MM').format(parsedDate);
    String iconUrl =fixIconUrl(json["day"]["condition"]["icon"]) ;

    return WeatherResponse(
      image: iconUrl,
      temp: (json["day"]["avgtemp_c"] as num).toInt(),
      condition: json["day"]["condition"]["text"],
      date: formattedDate,
    );
  }

  factory WeatherResponse.fromastro(Map<String, dynamic> json){
    return WeatherResponse(
      sunrise:json["sunrise"] ,
      sunset:json["sunset"],
      moonrise:json["moonrise"],
      moonset:json["moonset"],
      moonPhase:json["moon_phase"],
      moonIllumination:json["moon_illumination"],
    );
  }
}

String fixIconUrl(String url) {
  if (url.startsWith("//")) return "https:$url";
  return url;
}
