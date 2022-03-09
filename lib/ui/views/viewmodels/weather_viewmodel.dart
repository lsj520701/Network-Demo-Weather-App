import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:networking_demo/enums/api_status.dart';
import 'package:networking_demo/enums/view_state.dart';
import 'package:networking_demo/models/api_response.dart';
import 'package:networking_demo/models/weather_model.dart';
import 'package:networking_demo/services/weather_service.dart';
import 'package:networking_demo/ui/views/viewmodels/base_model.dart';

class WeatherViewModel extends BaseViewModel {
  final WeatherService _weatherService = WeatherService.instance;
  TextEditingController controller = TextEditingController();
  WeatherModel? _weatherModel;
  WeatherModel? get weatherModel => _weatherModel;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  fetcthWeather() async {
    try {
      if (controller.text.isEmpty) {
        Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: "Please enter a valid city name.",
        );
      } else {
        setViewState(ViewState.busy);
        ApiResponse response =
            await _weatherService.getWeatherDetails(controller.text);
        setViewState(ViewState.idle);
        if (response.status == Status.success) {
          // ignore: avoid_print
          _weatherModel = response.data;
          notifyListeners();
        } else if (response.status == Status.networkError) {
          setViewState(ViewState.networkError);
          Fluttertoast.showToast(
            gravity: ToastGravity.CENTER,
            msg: "An Error Occured, please check your network connection.",
          );
        } else if (response.status == Status.error) {
          setViewState(ViewState.error);
          Fluttertoast.showToast(
            gravity: ToastGravity.CENTER,
            msg: response.data,
          );
        } else {
          setViewState(ViewState.error);
          Fluttertoast.showToast(
            gravity: ToastGravity.CENTER,
            msg: response.data,
          );
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error: $e");
      setViewState(ViewState.error);
    }
  }
}
