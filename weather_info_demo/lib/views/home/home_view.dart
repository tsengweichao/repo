import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info_demo/app/provider/provider.dart';
import 'package:weather_info_demo/views/widgets/error_view.dart';
import 'package:weather_info_demo/views/widgets/initial_view.dart';
import 'package:weather_info_demo/views/widgets/loading_view.dart';
import 'package:weather_info_demo/views/widgets/weather_info_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherFutureProvider);
    final locationName = ref.watch(inputLocationNameProvider);
    final locationNameTextCtrl = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          elevation: 11.0,
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: locationNameTextCtrl,
                    decoration: const InputDecoration(
                      labelText: "請輸入城市名稱",
                      prefixIcon: Icon(Icons.room_outlined),
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                          onPressed: () async {
                            ref
                                .read(inputLocationNameProvider.notifier)
                                .update((state) => locationNameTextCtrl.text.trim());
                            return ref.refresh(weatherFutureProvider.future);
                          },
                          child: const Text('確認'));
                    },
                  )),
            ],
          ),
        ),
        Expanded(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Card(
              elevation: 11.0,
              child: locationName == null
                  ? const InitialView()
                  : weatherAsync.when(
                      skipLoadingOnRefresh: false,
                      data: (weather) {
                        if (weather.success) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WeatherInfoView(
                              weatherInfo: weather,
                            ),
                          );
                        } else {
                          return ErrorView(
                            weatherInfo: weather,
                          );
                        }
                      },
                      error: (err, stack) => const ErrorView(),
                      loading: () => const LoadingView(),
                    )),
        )),
      ],
    );
  }
}
