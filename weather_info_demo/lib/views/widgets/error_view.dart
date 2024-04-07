import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info_demo/model/weather_info/weather_info.dart';

class ErrorView extends ConsumerWidget {
  final WeatherInfo? weatherInfo;
  const ErrorView({super.key, this.weatherInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('發生以下錯誤'),
          Text('錯誤狀態: ${weatherInfo?.error.errorType ?? '未定義之錯誤'}'),
          Text('錯誤訊息:${weatherInfo?.error.message ?? '無錯誤訊息資訊'}'),
        ],
      ),
    );
  }
}
