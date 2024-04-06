import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info_demo/app/tools/tools.dart';
import 'package:weather_info_demo/app/weather_api/query_weather_data.dart';

final countProvider = StateProvider<int>((ref) {
  return 0;
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('作業題目')),
        body: Column(
          children: [
            Text('$count'),
            ElevatedButton(
              onPressed: () async {
                // ref.read(countProvider.notifier).state++;
                var res = await QueryWeatherData().getWeather();
                printLog(res.toJson());
              },
              child: const Text('add 1'),
            ),
          ],
        ),
      ),
    );
  }
}
