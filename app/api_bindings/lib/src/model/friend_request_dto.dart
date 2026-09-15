//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_request_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FriendRequestDto {
  /// Returns a new [FriendRequestDto] instance.
  FriendRequestDto({
    required this.senderId,

    this.senderUserName,

    required this.targetId,

    this.targetUserName,

    this.state,

    this.createdAt,
  });

  @JsonKey(name: r'senderId', required: true, includeIfNull: false)
  final int senderId;

  @JsonKey(name: r'senderUserName', required: false, includeIfNull: false)
  final String? senderUserName;

  @JsonKey(name: r'targetId', required: true, includeIfNull: false)
  final int targetId;

  @JsonKey(name: r'targetUserName', required: false, includeIfNull: false)
  final String? targetUserName;

  @JsonKey(name: r'state', required: false, includeIfNull: false)
  final String? state;

  @JsonKey(name: r'createdAt', required: false, includeIfNull: false)
  final DateTime? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendRequestDto &&
          other.senderId == senderId &&
          other.senderUserName == senderUserName &&
          other.targetId == targetId &&
          other.targetUserName == targetUserName &&
          other.state == state &&
          other.createdAt == createdAt;

  @override
  int get hashCode =>
      senderId.hashCode +
      senderUserName.hashCode +
      targetId.hashCode +
      targetUserName.hashCode +
      state.hashCode +
      createdAt.hashCode;

  factory FriendRequestDto.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FriendRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
