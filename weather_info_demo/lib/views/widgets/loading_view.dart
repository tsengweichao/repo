import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingView extends ConsumerWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('資料讀取中，請稍後...'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
