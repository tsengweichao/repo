import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_info_demo/views/home/home_view.dart';

/*
我是第一次使用riverpod做狀態管理，因為時間因素，沒有太多的深入研究，所以可能架構上沒有很規範。
我目前比較熟悉的狀態管理是用GetX，撰寫上比較常以model-viewmodel-view的架構處理，model我通常是定義資料格式。
vewmodel是相對應view的所有狀態與相關函式，view的部分就是單純的UI部分。
因為riverpod是採用全域provider的方式作架構，所以我還沒統整或總結出比較好的規劃方式，這部分可以依日後團隊規範作配合。
iOS模擬器部分，因為目前我的工作電腦是windows系統，尚且無法作測試。
Android模擬器=>測試完成
Chrome Web模擬=>測試完成

p.s.
不知為何我一直無法開啟中央氣象局開放資料的網站，api也無法執行，似乎是我的ip被封鎖，防火牆也關閉了，dns也刷新了。
後來我是vpn到別的路由後才可以正確取得資訊，這方面還在研究是什麼原因造成的。
*/

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('作業題目')),
        body: const HomeView(),
      ),
    );
  }
}
