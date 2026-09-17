//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/user_profile_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sent_request_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SentRequestDto {
  /// Returns a new [SentRequestDto] instance.
  SentRequestDto({
    required this.targetId,

    required this.target,

    required this.createdAt,
  });

  @JsonKey(name: r'targetId', required: true, includeIfNull: false)
  final String targetId;

  @JsonKey(name: r'target', required: true, includeIfNull: false)
  final UserProfileDto target;

  @JsonKey(name: r'createdAt', required: true, includeIfNull: false)
  final DateTime createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SentRequestDto &&
          other.targetId == targetId &&
          other.target == target &&
          other.createdAt == createdAt;

  @override
  int get hashCode => targetId.hashCode + target.hashCode + createdAt.hashCode;

  factory SentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SentRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SentRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
