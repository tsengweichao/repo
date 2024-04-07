import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info_demo/app/extensions/datetime_extensions.dart';
import 'package:weather_info_demo/model/weather_info/weather_element.dart';
import 'package:weather_info_demo/model/weather_info/weather_info.dart';

class WeatherInfoView extends ConsumerWidget {
  final WeatherInfo weatherInfo;
  const WeatherInfoView({super.key, required this.weatherInfo});

  String getParameterString(ElementNameEnum type, String parameter) {
    switch (type) {
      case ElementNameEnum.pop:
        return '$parameter %';
      case ElementNameEnum.maxT:
      case ElementNameEnum.minT:
        return '$parameter 度';
      default:
        return parameter;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(weatherInfo.records.datasetDescription),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: [
          ...weatherInfo.records.location.map((e) => ListTile(
                title: Text(e.locationName),
                subtitle: Column(
                  children: e.weatherElement
                      .map(
                        (element) => Card(
                          child: Column(
                            children: [
                              Text(element.elementType.description),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...element.time.map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(e.startTime.toFormatString('yyyy-MM-dd hh a')),
                                              Text(e.endTime.toFormatString('yyyy-MM-dd hh a')),
                                              Text(getParameterString(element.elementType, e.parameter.parameterName))
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ))
        ],
      ),
    );
  }
}
