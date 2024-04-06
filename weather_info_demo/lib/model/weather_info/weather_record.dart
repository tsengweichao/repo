import 'package:weather_info_demo/model/weather_info/weather_location.dart';

class WeatherRecord {
  String datasetDescription;
  List<WeatherLocation> location;
  WeatherRecord({String? datasetDescription, List<WeatherLocation>? location})
      : datasetDescription = datasetDescription ?? '',
        location = location ?? [];

  WeatherRecord.fromJson(Map<String, dynamic> json)
      : datasetDescription = '',
        location = [] {
    datasetDescription = json.containsKey('datasetDescription') ? json['datasetDescription'] : '';
    location = json.containsKey('location') ? [for (var v in json['location'] ?? []) WeatherLocation.fromJson(v)] : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['datasetDescription'] = datasetDescription;
    data['location'] = location.map((e) => e.toJson()).toList();

    return data;
  }
}
