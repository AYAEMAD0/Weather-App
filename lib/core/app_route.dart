import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../screens/details_screen/details_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/main_screen/main_screen.dart';
import '../screens/onboarding_screen/onboarding_screen.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

class AppRoute {
  static Route<dynamic>? route(settings) {
    switch (settings.name) {
      case SplashScreen.splashRouteName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case OnboardingScreen.onboardingRouteName:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case MainScreen.mainRouteName:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case HomeScreen.homeRouteName:
        final position = settings.arguments as Position;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(position: position),
        );
      case SearchScreen.searchRouteName:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case DetailsScreen.detailsRouteName:
        final position = settings.arguments as Position;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(position: position),
        );
    }
    return null;
  }
}
