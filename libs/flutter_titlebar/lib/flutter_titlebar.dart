import 'flutter_titlebar_platform_interface.dart';

class FlutterTitlebar {
  static Future addButtons() async {
    return await FlutterTitlebarPlatform.instance?.addButtons();
  }

  static Future setBackEnabled(bool isEnabled) async {
    return await FlutterTitlebarPlatform.instance?.setBackEnabled(isEnabled);
  }

  static Future setContinueEnabled(bool isEnabled) async {
    return await FlutterTitlebarPlatform.instance?.setContinueEnabled(
      isEnabled,
    );
  }

  static set backCallback(Function? cb) =>
      FlutterTitlebarPlatform.instance?.backCallback = cb;
  static set continueCallback(Function? cb) =>
      FlutterTitlebarPlatform.instance?.continueCallback = cb;
}
