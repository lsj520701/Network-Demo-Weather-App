import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromMap(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.locationName,
    required this.wind,
    required this.cloud,
    required this.humidity,
    required this.weatherDescription,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
    required this.weather,
    required this.date,
  });

  String locationName;
  double wind;
  double cloud;
  double humidity;
  String weatherDescription;
  double temp;
  double minTemp;
  double maxTemp;
  String icon;
  String weather;
  DateTime date;
  //
  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        locationName: json["name"],
        wind: json["wind"]["speed"].toDouble(),
        cloud: json["clouds"]["all"].toDouble(),
        humidity: json["main"]["humidity"].toDouble(),
        weatherDescription: json["weather"][0]["description"],
        weather: json["weather"][0]["main"].toString().toLowerCase(),
        temp: json["main"]["temp"].toDouble(),
        minTemp: json["main"]["temp_min"].toDouble(),
        maxTemp: json["main"]["temp_max"].toDouble(),
        icon: json["weather"][0]["icon"],
        date: DateTime.now(),
      );

  factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        locationName: json["locationName"],
        wind: json["wind"].toDouble(),
        cloud: json["cloud"].toDouble(),
        humidity: json["humidity"].toDouble(),
        weatherDescription: json["weatherDescription"],
        weather: json["weather"].toString().toLowerCase(),
        temp: json["temp"].toDouble(),
        minTemp: json["minTemp"].toDouble(),
        maxTemp: json["maxTemp"].toDouble(),
        icon: json["icon"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "wind": wind,
        "cloud": cloud,
        "humidity": humidity,
        "weatherDescription": weatherDescription,
        "temp": temp,
        "minTemp": minTemp,
        "maxTemp": maxTemp,
        "icon": icon,
        "weather": weather,
        "date": date.toString(),
      };
}
