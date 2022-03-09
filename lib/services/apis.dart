import 'package:networking_demo/keys.dart';

class Apis {
  static  String getWeather(String city)=> "https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&APPID=$apiKey";
}
