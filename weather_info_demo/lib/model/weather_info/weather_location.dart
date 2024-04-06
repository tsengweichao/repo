import 'package:weather_info_demo/model/weather_info/weather_element.dart';

class WeatherLocation {
  String locationName;
  List<WeatherElement> weatherElement;
  WeatherLocation({String? locationName, List<WeatherElement>? weatherElement})
      : locationName = locationName ?? '',
        weatherElement = weatherElement ?? [];

  WeatherLocation.fromJson(Map<String, dynamic> json)
      : locationName = '',
        weatherElement = [] {
    locationName = json.containsKey('locationName') ? json['locationName'] : '';
    weatherElement = json.containsKey('weatherElement')
        ? [for (var v in json['weatherElement'] ?? []) WeatherElement.fromJson(v)]
        : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['locationName'] = locationName;
    data['weatherElement'] = weatherElement.map((e) => e.toJson()).toList();

    return data;
  }
}
