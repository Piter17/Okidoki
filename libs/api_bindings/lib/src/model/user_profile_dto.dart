//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/user_online_state.dart';
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

    required this.userName,

    this.nickname,

    this.state,

    this.profilePicture,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'userName', required: true, includeIfNull: false)
  final String userName;

  @JsonKey(name: r'nickname', required: false, includeIfNull: false)
  final String? nickname;

  @JsonKey(name: r'state', required: false, includeIfNull: false)
  final UserOnlineState? state;

  @JsonKey(name: r'profilePicture', required: false, includeIfNull: false)
  final String? profilePicture;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileDto &&
          other.id == id &&
          other.userName == userName &&
          other.nickname == nickname &&
          other.state == state &&
          other.profilePicture == profilePicture;

  @override
  int get hashCode =>
      id.hashCode +
      userName.hashCode +
      (nickname == null ? 0 : nickname.hashCode) +
      (state == null ? 0 : state.hashCode) +
      (profilePicture == null ? 0 : profilePicture.hashCode);

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
