import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

class const ThemeSettings({
  required final Brightness brightness,
  required final bool isBrightnessSetByUser,
  required final Color primaryColor,
  required final bool isColorSetByUser,
  required final Color backgroundColor,
});

@riverpod
class CurrentTheme extends _$CurrentTheme {
  static const defaultPrimaryColor = Color(0xff0d6efd);

  @override
  ThemeSettings build() {
    final settings = ref.watch(appSettingsProvider);
    final systemSettings = ref.watch(systemSettingsProvider);
    final brightness = settings.brightness ?? systemSettings.brightness;
    return ThemeSettings(
      isBrightnessSetByUser: settings.brightness != null,
      brightness: brightness,
      primaryColor: settings.color ?? defaultPrimaryColor,
      isColorSetByUser: settings.color != null,
      backgroundColor: brightness == Brightness.dark
          ? Color(0xff212529)
          : Color(0xffdee2e6),
    );
  }

  Future<void> setBrightness(Brightness? value) async {
    final appSettings = ref.read(appSettingsProvider.notifier);
    appSettings.setBrightness(value);
  }

  Future<void> setColor(Color? value) async {
    final appSettings = ref.read(appSettingsProvider.notifier);
    appSettings.setColor(value);
  }
}
