//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_profile_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateUserProfileRequest {
  /// Returns a new [UpdateUserProfileRequest] instance.
  UpdateUserProfileRequest({this.guildId, this.profileName});

  @JsonKey(name: r'guildId', required: false, includeIfNull: false)
  final String? guildId;

  @JsonKey(name: r'profileName', required: false, includeIfNull: false)
  final String? profileName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateUserProfileRequest &&
          other.guildId == guildId &&
          other.profileName == profileName;

  @override
  int get hashCode =>
      (guildId == null ? 0 : guildId.hashCode) +
      (profileName == null ? 0 : profileName.hashCode);

  factory UpdateUserProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserProfileRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
