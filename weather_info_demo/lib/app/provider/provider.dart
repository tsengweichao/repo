import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info_demo/app/weather_api/query_weather_data.dart';
import 'package:weather_info_demo/model/weather_info/weather_info.dart';

final inputLocationNameProvider = StateProvider<String?>((ref) {
  return null;
});

final weatherFutureProvider = FutureProvider.autoDispose<WeatherInfo>((ref) {
  var locationName = ref.read(inputLocationNameProvider);
  return QueryWeatherData().getWeather(locationName: locationName);
});
