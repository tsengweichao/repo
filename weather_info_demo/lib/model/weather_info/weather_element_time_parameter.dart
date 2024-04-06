class WeatherElementTimeParameter {
  String parameterName;
  String parameterValue;

  WeatherElementTimeParameter({String? parameterName, String? parameterValue})
      : parameterName = parameterName ?? '',
        parameterValue = parameterValue ?? '';

  WeatherElementTimeParameter.fromJson(Map<String, dynamic> json)
      : parameterName = '',
        parameterValue = '' {
    parameterName = json.containsKey('parameterName') ? json['parameterName'] : '';
    parameterValue = json.containsKey('parameterValue') ? json['parameterValue'] : '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['parameterName'] = parameterName;
    data['parameterValue'] = parameterValue;

    return data;
  }
}
