import 'package:flutter/material.dart';
import 'package:weather/screens/details_screen/details_screen.dart';
import 'package:weather/screens/home_screen/home_screen.dart';
import 'package:weather/screens/onboarding_screen/onboarding_screen.dart';
import 'package:weather/screens/search_screen/search_screen.dart';
import 'package:weather/screens/splash_screen/splash_screen.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.splash_routeName:(context)=>SplashScreen(),
        OnboardingScreen.onboarding_routeName:(context)=>OnboardingScreen(),
        HomeScreen.home_routeName: (context) => HomeScreen(),
        SearchScreen.search_routeName:(context)=>SearchScreen(),
        DetailsScreen.details_routeName:(context)=>DetailsScreen(),
      },
      home: SplashScreen(),
    );
  }


}
