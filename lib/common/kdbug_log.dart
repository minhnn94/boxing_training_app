import 'package:flutter/foundation.dart';

void kDebugLog(String message) {
  if (kDebugMode) {
    print(message);
  }
}
