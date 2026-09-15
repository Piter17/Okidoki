import 'dart:async';
import 'package:flutter/services.dart';

class BackLongPressBus {
  static const _channel = MethodChannel('back_longpress');

  static final StreamController<void> _controller =
      StreamController<void>.broadcast();

  static Stream<void> get stream => _controller.stream;

  static Future<void> init() async {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onBackLongPress') {
        _controller.add(null);
      }
    });
  }
}
