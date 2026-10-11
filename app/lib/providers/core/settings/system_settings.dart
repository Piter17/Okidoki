import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_settings.freezed.dart';
part 'system_settings.g.dart';

@freezed
class const SystemSettings({
  required final Brightness brightness,
  required final List<Locale> locales,
}) with _$SystemSettings;

@riverpod
class SystemSettingsNotifier extends _$SystemSettingsNotifier
    with WidgetsBindingObserver {
  @override
  SystemSettings build() {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(this));
    return SystemSettings(
      brightness: WidgetsBinding.instance.platformDispatcher.platformBrightness,
      locales: WidgetsBinding.instance.platformDispatcher.locales,
    );
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    state = state.copyWith(
      locales: locales ?? WidgetsBinding.instance.platformDispatcher.locales,
    );
    super.didChangeLocales(locales);
  }

  @override
  void didChangePlatformBrightness() {
    state = state.copyWith(
      brightness: WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );
    super.didChangePlatformBrightness();
  }
}
