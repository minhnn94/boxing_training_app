import 'dart:convert';

import 'package:boxing_traning/common/kdbug_log.dart';
import 'package:flutter/services.dart';

class ImageUtils {
  void savePicture() async {
    ByteData bytes = await rootBundle.load('assets/images/conor.jpeg');
    var buffer = bytes.buffer;
    var m = const Base64Encoder().convert(Uint8List.view(buffer));
    kDebugLog(m);
  }
}
