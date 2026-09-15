import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riv/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riv/core/core.dart' as c;

part 'settings.g.dart';

@riverpod
SharedPreferences globalPreferences(Ref ref) => throw UnimplementedError(
  "globalPreferencesProvider need to be set in providerScope",
);

@riverpod
SharedPreferences userPreferences(Ref ref) => throw UnimplementedError(
  "userPreferencesProvider need to be set in providerScope",
);

@riverpod
class UserSettingsNotifier extends _$UserSettingsNotifier {
  late SharedPreferences _prefs;

  @override
  c.UserSettings build() {
    _prefs = ref.watch(userPreferencesProvider);

    final s = c.UserSettings(
      color: _prefs.getInt('color') ?? 0xff0d6efd,
      darkMode: _prefs.getBool('darkMode') ?? false,
      lastGuild: _prefs.getString('lastGuild'),
    );
    return s;
  }

  Future<void> setDarkMode(bool value) async {
    state = state.copyWith(darkMode: value);
    await _prefs.setBool('darkMode', value);
  }

  Future<void> setColor(int value) async {
    state = state.copyWith(color: value);
    await _prefs.setInt('color', value);
  }

  Future<void> setLastGuild(String? value) async {
    state = state.copyWith(lastGuild: value);
    if (value == null) {
      await _prefs.remove('lastGuild');
    } else {
      await _prefs.setString('lastGuild', value);
    }
  }
}

@riverpod
class AppSettingsNotifier extends Notifier<c.Settings> {
  late SharedPreferences _prefs;

  @override
  c.Settings build() {
    _prefs = ref.watch(globalPreferencesProvider);

    final s = c.Settings(
      color: _prefs.getInt('color') ?? 0xff0d6efd,
      darkMode: _prefs.getBool('darkMode') ?? false,
      navigatorWidth: _prefs.getDouble("navigatorWidth") ?? 234,
      language: Language.fromStorage(_prefs.getString('languageCode') ?? "pl"),
    );
    return s;
  }

  Future<void> setDarkMode(bool value) async {
    state = state.copyWith(darkMode: value);
    await _prefs.setBool('darkMode', value);
  }

  Future<void> setColor(int value) async {
    state = state.copyWith(color: value);
    await _prefs.setInt('setColor', value);
  }

  Future<void> setNavigatorWidth(double value) async {
    state = state.copyWith(navigatorWidth: value);
    await _prefs.setDouble('navigatorWidth', value);
  }

  Future<void> setLanguage(Language lang) async {
    state = state.copyWith(language: lang);
    await _prefs.setString('languageCode', lang.forStorage());
  }
}
