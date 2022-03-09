import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:networking_demo/enums/view_state.dart';
import 'package:networking_demo/ui/views/viewmodels/weather_viewmodel.dart';

final weatherViewModelInstance =
    ChangeNotifierProvider.autoDispose<WeatherViewModel>(
        (ref) => WeatherViewModel());

class WeatherView extends ConsumerWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(weatherViewModelInstance);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: model.controller,
                decoration: const InputDecoration(
                  hintText: "Enter City Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              model.weatherModel == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: ${model.weatherModel!.locationName}"),
                            Text("Humidity: ${model.weatherModel!.humidity}"),
                            Text("Wind: ${model.weatherModel!.wind}"),
                            Text("Cloud: ${model.weatherModel!.cloud}"),
                            Text("WeatherDescription: ${model.weatherModel!.weatherDescription}"),
                            Text("Weather: ${model.weatherModel!.weather}"),
                            Text("Temp: ${model.weatherModel!.temp}"),
                            Text("MinTemp: ${model.weatherModel!.minTemp}"),
                            Text("MaxTemp: ${model.weatherModel!.maxTemp}"),
                            Text("Icon: ${model.weatherModel!.icon}"),
                            Text("Date: ${model.weatherModel!.date}")
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 60,
              ),
              model.viewState == ViewState.busy
                  ? const CircularProgressIndicator.adaptive()
                  : TextButton(
                      onPressed: () => model.fetcthWeather(),
                      child: const Text("Search"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
