import 'package:weather_info_demo/model/weather_info/weather_element_time_parameter.dart';

class WeatherElementTime {
  DateTime startTime;
  DateTime endTime;
  WeatherElementTimeParameter parameter;

  WeatherElementTime({DateTime? startTime, DateTime? endTime, WeatherElementTimeParameter? parameter})
      : startTime = startTime ?? DateTime.now(),
        endTime = endTime ?? DateTime.now(),
        parameter = parameter ?? WeatherElementTimeParameter();

  WeatherElementTime.fromJson(Map<String, dynamic> json)
      : startTime = DateTime.now(),
        endTime = DateTime.now(),
        parameter = WeatherElementTimeParameter() {
    startTime = json.containsKey('startTime') ? DateTime.parse(json['startTime']) : DateTime.now();
    endTime = json.containsKey('endTime') ? DateTime.parse(json['endTime']) : DateTime.now();
    parameter = json.containsKey('parameter')
        ? WeatherElementTimeParameter.fromJson(json['parameter'])
        : WeatherElementTimeParameter();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['startTime'] = startTime.toIso8601String();
    data['endTime'] = endTime.toIso8601String();
    data['parameter'] = parameter.toJson();

    return data;
  }
}
