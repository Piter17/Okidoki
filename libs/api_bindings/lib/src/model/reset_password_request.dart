//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResetPasswordRequest {
  /// Returns a new [ResetPasswordRequest] instance.
  ResetPasswordRequest({
    required this.email,

    required this.resetCode,

    required this.newPassword,
  });

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'resetCode', required: true, includeIfNull: false)
  final String resetCode;

  @JsonKey(name: r'newPassword', required: true, includeIfNull: false)
  final String newPassword;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResetPasswordRequest &&
          other.email == email &&
          other.resetCode == resetCode &&
          other.newPassword == newPassword;

  @override
  int get hashCode =>
      email.hashCode + resetCode.hashCode + newPassword.hashCode;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
