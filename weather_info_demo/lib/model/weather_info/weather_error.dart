class WeatherError {
  String errorType;
  String message;

  WeatherError({String? errorType, String? message})
      : errorType = errorType ?? '',
        message = message ?? '';

  WeatherError.fromJson(Map<String, dynamic> json)
      : errorType = '',
        message = '' {
    errorType = json.containsKey('errorType') ? json['errorType'] : '';
    message = json.containsKey('message') ? json['message'] : '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['errorType'] = errorType;
    data['message'] = message;

    return data;
  }
}
