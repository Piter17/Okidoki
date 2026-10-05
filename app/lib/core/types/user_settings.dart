import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okidoki/core/types/language.dart';

part 'user_settings.freezed.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required bool darkMode,
    required Color color,
    required double navigatorWidth,
    required Language language,
    required bool developerMode,
    required bool isUserListVisible,
  }) = _Settings;
}

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    required bool darkMode,
    required int color,
    required String? lastGuild,
    required Map<String, String> lastChannels,
  }) = _UserSettings;
}
