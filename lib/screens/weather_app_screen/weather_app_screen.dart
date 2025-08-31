import 'package:flutter/material.dart';
import 'package:weather/core/app_route.dart';
import 'package:weather/screens/splash_screen/splash_screen.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) =>AppRoute.route(settings),
      home: SplashScreen(),
    );
  }
}
