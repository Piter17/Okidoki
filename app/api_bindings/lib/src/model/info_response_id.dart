//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_response_id.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InfoResponseId {
  /// Returns a new [InfoResponseId] instance.
  InfoResponseId({
    required this.userId,
    required this.userName,
    required this.email,
    required this.isEmailConfirmed,
  });

  @JsonKey(
    name: r'userId',
    required: true,
    includeIfNull: false,
  )
  final int userId;

  @JsonKey(
    name: r'userName',
    required: true,
    includeIfNull: false,
  )
  final String userName;

  @JsonKey(
    name: r'email',
    required: true,
    includeIfNull: false,
  )
  final String email;

  @JsonKey(
    name: r'isEmailConfirmed',
    required: true,
    includeIfNull: false,
  )
  final bool isEmailConfirmed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoResponseId &&
          other.userId == userId &&
          other.userName == userName &&
          other.email == email &&
          other.isEmailConfirmed == isEmailConfirmed;

  @override
  int get hashCode =>
      userId.hashCode +
      userName.hashCode +
      email.hashCode +
      isEmailConfirmed.hashCode;

  factory InfoResponseId.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseIdFromJson(json);

  Map<String, dynamic> toJson() => _$InfoResponseIdToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
