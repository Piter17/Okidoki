//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FriendDto {
  /// Returns a new [FriendDto] instance.
  FriendDto({
    required this.userId,

    required this.userName,

    this.nickname,

    this.createdAt,
  });

  @JsonKey(name: r'userId', required: true, includeIfNull: false)
  final String userId;

  @JsonKey(name: r'userName', required: true, includeIfNull: false)
  final String userName;

  @JsonKey(name: r'nickname', required: false, includeIfNull: false)
  final String? nickname;

  @JsonKey(name: r'createdAt', required: false, includeIfNull: false)
  final DateTime? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendDto &&
          other.userId == userId &&
          other.userName == userName &&
          other.nickname == nickname &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      userId.hashCode +
      userName.hashCode +
      (nickname == null ? 0 : nickname.hashCode) +
      createdAt.hashCode;

  factory FriendDto.fromJson(Map<String, dynamic> json) =>
      _$FriendDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FriendDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
