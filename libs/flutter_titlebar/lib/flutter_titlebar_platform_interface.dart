import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_titlebar_method_channel.dart';

abstract class FlutterTitlebarPlatform extends PlatformInterface {
  /// Constructs a FlutterTitlebarPlatform.
  FlutterTitlebarPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterTitlebarPlatform? _instance;

  /// The default instance of [FlutterTitlebarPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterTitlebar].
  static FlutterTitlebarPlatform? get instance {
    if (kIsWeb) return null;
    if (Platform.isMacOS) return _instance = MethodChannelFlutterTitlebar();
    return null;
  }

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterTitlebarPlatform] when
  /// they register themselves.
  static set instance(FlutterTitlebarPlatform? instance) {
    if (instance == null) return;
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Function? backCallback;
  Function? continueCallback;

  Future addButtons() {
    throw UnimplementedError('addButtons() has not been implemented.');
  }

  Future setBackEnabled(bool isEnabled) {
    throw UnimplementedError('setBackEnabled() has not been implemented.');
  }

  Future setContinueEnabled(bool enabled) {
    throw UnimplementedError('setContinueEnabled() has not been implemented.');
  }
}
