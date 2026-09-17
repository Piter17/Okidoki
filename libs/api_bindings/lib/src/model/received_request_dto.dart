//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/user_profile_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'received_request_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReceivedRequestDto {
  /// Returns a new [ReceivedRequestDto] instance.
  ReceivedRequestDto({
    required this.senderId,

    required this.sender,

    required this.createdAt,
  });

  @JsonKey(name: r'senderId', required: true, includeIfNull: false)
  final String senderId;

  @JsonKey(name: r'sender', required: true, includeIfNull: false)
  final UserProfileDto sender;

  @JsonKey(name: r'createdAt', required: true, includeIfNull: false)
  final DateTime createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceivedRequestDto &&
          other.senderId == senderId &&
          other.sender == sender &&
          other.createdAt == createdAt;

  @override
  int get hashCode => senderId.hashCode + sender.hashCode + createdAt.hashCode;

  factory ReceivedRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReceivedRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReceivedRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
