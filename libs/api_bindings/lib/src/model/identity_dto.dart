//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityDto {
  /// Returns a new [IdentityDto] instance.
  IdentityDto({
    required this.userName,

    this.email,

    required this.userId,

    required this.isEmailConfirmed,
  });

  @JsonKey(name: r'userName', required: true, includeIfNull: false)
  final String userName;

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'userId', required: true, includeIfNull: false)
  final String userId;

  @JsonKey(name: r'isEmailConfirmed', required: true, includeIfNull: false)
  final bool isEmailConfirmed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityDto &&
          other.userName == userName &&
          other.email == email &&
          other.userId == userId &&
          other.isEmailConfirmed == isEmailConfirmed;

  @override
  int get hashCode =>
      userName.hashCode +
      email.hashCode +
      userId.hashCode +
      isEmailConfirmed.hashCode;

  factory IdentityDto.fromJson(Map<String, dynamic> json) =>
      _$IdentityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
