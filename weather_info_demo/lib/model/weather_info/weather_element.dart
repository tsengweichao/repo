import 'package:collection/collection.dart';
import 'package:weather_info_demo/model/weather_info/weather_element_time.dart';

enum ElementNameEnum {
  ///天氣現象
  wx('Wx', '天氣現象'),

  ///最高溫度
  maxT('MaxT', '最高溫度'),

  ///最低溫度
  minT('MinT', '最低溫度'),

  ///舒適度
  ci('CI', '舒適度'),

  ///降雨機率
  pop('PoP', '降雨機率'),
  none('none', '未定義');

  const ElementNameEnum(this.name, this.description);
  final String name;
  final String description;

  static ElementNameEnum parse(String name) {
    return ElementNameEnum.values.firstWhereOrNull((element) => element.name == name) ?? ElementNameEnum.none;
  }
}

class WeatherElement {
  String elementName;
  List<WeatherElementTime> time;
  ElementNameEnum elementType = ElementNameEnum.none;
  WeatherElement({String? elementName, List<WeatherElementTime>? time})
      : elementName = elementName ?? '',
        time = time ?? [];

  WeatherElement.fromJson(Map<String, dynamic> json)
      : elementName = '',
        time = [] {
    elementName = json.containsKey('elementName') ? json['elementName'] : '';
    elementType = ElementNameEnum.parse(elementName);
    time = json.containsKey('time') ? [for (var v in json['time'] ?? []) WeatherElementTime.fromJson(v)] : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['elementName'] = elementName;
    data['time'] = time.map((e) => e.toJson()).toList();

    return data;
  }
}
