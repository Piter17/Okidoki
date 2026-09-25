import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riv/core/types/language.dart';

part 'user_settings.freezed.dart';

// part 'user_settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required bool darkMode,
    required Color color,
    required double navigatorWidth,
    required Language language,
  }) = _Settings;

  // factory Settings.fromJson(Map<String, Object?> json) =>
  // _$SettingsFromJson(json);
}

@freezed
abstract class UserSettings with _$UserSettings {
  const factory UserSettings({
    required bool darkMode,
    required int color,
    required String? lastGuild,
    required Map<String, String> lastChannels,
  }) = _UserSettings;

  // factory UserSettings.fromJson(Map<String, Object?> json) =>
  //     _$UserSettingsFromJson(json);
}

// class UserSettings
// {
//   final bool _darkMode;

// }

// class ARGBConverter extends JsonConverter<Color, int> {
//   @override
//   Color fromJson(int json) => Color(json);

//   @override
//   int toJson(Color object) => object.toARGB32();
// }
// @JsonSerializable()
// @MyJsonConverter()
