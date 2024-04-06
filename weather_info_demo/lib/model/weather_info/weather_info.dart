import 'package:weather_info_demo/model/weather_info/weather_error.dart';
import 'package:weather_info_demo/model/weather_info/weather_record.dart';

class WeatherInfo {
  bool success;
  WeatherError error;
  WeatherRecord records;
  WeatherInfo({bool? success, WeatherRecord? records, WeatherError? error})
      : success = success ?? false,
        records = records ?? WeatherRecord(),
        error = error ?? WeatherError();

  WeatherInfo.fromJson(Map<String, dynamic> json)
      : success = false,
        records = WeatherRecord(),
        error = WeatherError() {
    success = json.containsKey('success') ? bool.parse(json['success']) : false;
    records = json.containsKey('records') ? WeatherRecord.fromJson(json['records']) : WeatherRecord();
    error = json.containsKey('error') ? WeatherError.fromJson(json['error']) : WeatherError();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['success'] = success;
    data['records'] = records.toJson();
    data['error'] = error.toJson();
    return data;
  }
}
