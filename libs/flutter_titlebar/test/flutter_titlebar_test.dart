import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_titlebar/flutter_titlebar_platform_interface.dart';
import 'package:flutter_titlebar/flutter_titlebar_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterTitlebarPlatform
    with MockPlatformInterfaceMixin
    implements FlutterTitlebarPlatform {
  @override
  Function? backCallback;

  @override
  Function? continueCallback;

  @override
  Future<dynamic> addButtons() async {
    return null;
  }

  @override
  Future<dynamic> setBackEnabled(bool isEnabled) async {
    return null;
  }

  @override
  Future<dynamic> setContinueEnabled(bool enabled) async {
    return null;
  }
}

void main() {
  final FlutterTitlebarPlatform? initialPlatform =
      FlutterTitlebarPlatform.instance;

  test('$MethodChannelFlutterTitlebar is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterTitlebar>());
  });
}
