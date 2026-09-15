import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_titlebar_platform_interface.dart';

/// An implementation of [FlutterTitlebarPlatform] that uses method channels.
class MethodChannelFlutterTitlebar extends FlutterTitlebarPlatform {
  /// The method channel used to interact with the native platform.

  MethodChannelFlutterTitlebar() {
    methodChannel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "backButtonPressed":
          backCallback?.call();
          break;
        case "continueButtonPressed":
          continueCallback?.call();
          break;
      }
    });
  }

  static const channel_name = 'flutter_titlebar';

  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_titlebar');

  @override
  Future addButtons() {
    return methodChannel.invokeMethod<dynamic>('addButtons');
  }

  @override
  Future setBackEnabled(bool isEnabled) {
    return methodChannel.invokeMethod<dynamic>('setBackEnabled', isEnabled);
  }

  @override
  Future setContinueEnabled(bool enabled) {
    return methodChannel.invokeMethod<dynamic>('setContinueEnabled', enabled);
  }
}
