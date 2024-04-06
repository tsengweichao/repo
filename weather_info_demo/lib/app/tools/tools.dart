import 'package:flutter/foundation.dart';

void printLog(Object o) {
  if (kDebugMode) {
    print(o);
  }
}
