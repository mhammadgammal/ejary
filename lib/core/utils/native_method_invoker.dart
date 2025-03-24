import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

abstract class NativeMethodInvoker {
  static const _androidChannel =
      MethodChannel("com.example.ix/android/channel");
  static const _iosChannel = MethodChannel("com.example.ix/ios/channel");

  static Future invoke(String methodName) async {
    try {
      if (Platform.isAndroid) {
        return await _androidChannel.invokeMethod(methodName);
      } else {
        return await _iosChannel.invokeMethod(methodName);
      }
    } on PlatformException catch (e) {
      log('NativeMethodInvoker: ${e.code} ==> ${e.message}');
    }
  }
}
