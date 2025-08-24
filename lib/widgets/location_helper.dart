import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception("GPS مش شغال");

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("مرفوض إذن الموقع");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("الصلاحية مرفوضة نهائياً");
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
