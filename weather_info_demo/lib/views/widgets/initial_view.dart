import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialView extends ConsumerWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('''
初始狀態頁面
要求:
1. 請建立一個應用程式來串接一般天氣預報-今明36小時天氣預報
  a. 說明:https://pjchender.dev/react-bootcamp/docs/book/ch5/5-1/
  b. API : /v1/rest/datastore/F-C0032-001
2. 用戶應該可以在你的應用程式中輸入locationName,然後根據搜尋條件從API獲取數
據並顯示結果。例如:用戶可能會輸入一個城市的名字來獲取該城市的天氣預報。
3. 你的應用程式應該能夠處理錯誤的情況,
  a. API返回的數據格式不正確
  b. 用戶輸入的搜索條件無效。
附註:你需要實作四個Widget來表現 初始狀態,讀取中(不是用Dialog的行為),氣象資料和錯誤狀況'''),
    );
  }
}
