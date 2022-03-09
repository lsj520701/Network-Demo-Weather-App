import 'package:flutter/material.dart';
import 'package:networking_demo/route_paths.dart';
import 'package:networking_demo/ui/views/splash_screen_view.dart';
import 'package:networking_demo/ui/views/weather_view.dart';

class Routerr {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splashScreenView:
        return MaterialPageRoute(builder: (_) =>  SplashScreenView());
      case RoutePaths.weatherView:
        return MaterialPageRoute(builder: (_) => const WeatherView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Page Defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
