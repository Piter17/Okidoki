//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserProfileDto {
  /// Returns a new [UserProfileDto] instance.
  UserProfileDto({
    required this.id,

    required this.userId,

    this.guildId,

    this.nickname,

    this.profilePicture,

    this.userName,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'userId', required: true, includeIfNull: false)
  final String userId;

  @JsonKey(name: r'guildId', required: false, includeIfNull: false)
  final String? guildId;

  @JsonKey(name: r'nickname', required: false, includeIfNull: false)
  final String? nickname;

  @JsonKey(name: r'profilePicture', required: false, includeIfNull: false)
  final String? profilePicture;

  @JsonKey(name: r'userName', required: false, includeIfNull: false)
  final String? userName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileDto &&
          other.id == id &&
          other.userId == userId &&
          other.guildId == guildId &&
          other.nickname == nickname &&
          other.profilePicture == profilePicture &&
          other.userName == userName;

  @override
  int get hashCode =>
      id.hashCode +
      userId.hashCode +
      (guildId == null ? 0 : guildId.hashCode) +
      (nickname == null ? 0 : nickname.hashCode) +
      (profilePicture == null ? 0 : profilePicture.hashCode) +
      userName.hashCode;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
