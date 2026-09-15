//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user_profile_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateUserProfileRequest {
  /// Returns a new [CreateUserProfileRequest] instance.
  CreateUserProfileRequest({this.guildId, this.nickname, this.profilePicture});

  @JsonKey(name: r'guildId', required: false, includeIfNull: false)
  final String? guildId;

  @JsonKey(name: r'nickname', required: false, includeIfNull: false)
  final String? nickname;

  @JsonKey(name: r'profilePicture', required: false, includeIfNull: false)
  final String? profilePicture;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateUserProfileRequest &&
          other.guildId == guildId &&
          other.nickname == nickname &&
          other.profilePicture == profilePicture;

  @override
  int get hashCode =>
      (guildId == null ? 0 : guildId.hashCode) +
      (nickname == null ? 0 : nickname.hashCode) +
      (profilePicture == null ? 0 : profilePicture.hashCode);

  factory CreateUserProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserProfileRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
