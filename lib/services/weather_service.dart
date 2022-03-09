import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:networking_demo/enums/api_status.dart';
import 'package:networking_demo/models/api_response.dart';
import 'package:networking_demo/models/weather_model.dart';
import 'package:networking_demo/services/apis.dart';

class WeatherService {
  static WeatherService get instance => _instance;
  static final WeatherService _instance = WeatherService._();
  WeatherService._();
  Future<ApiResponse> getWeatherDetails(String city) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          Apis.getWeather(city),
        ),
        // headers: {'Authorization': "Bearer kjbbkbhjgvkcgcjkhgv "},
      );
      final decodedData = jsonDecode(response.body);
      // print(decodedData);
      if (response.statusCode == 200) {
        return ApiResponse(
          status: Status.success,
          data: WeatherModel.fromJson(decodedData),
        );
      } else {
        // *handle error
        return ApiResponse(
          status: Status.error,
          data: decodedData['message'],
        );
      }
    } catch (e) {
      // ignore: avoid_print
      if (e is HandshakeException ||
          e is SocketException ||
          e is TimeoutException) {
        return ApiResponse(status: Status.networkError, data: null);
      } else {
        return ApiResponse(status: Status.error, data: 'City Not Found');
      }
    }
  }
}
// HandshakeException
// SocketException