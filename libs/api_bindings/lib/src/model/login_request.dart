//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginRequest {
  /// Returns a new [LoginRequest] instance.
  LoginRequest({
    required this.email,

    required this.password,

    this.twoFactorCode,

    this.twoFactorRecoveryCode,
  });

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'password', required: true, includeIfNull: false)
  final String password;

  @JsonKey(name: r'twoFactorCode', required: false, includeIfNull: false)
  final String? twoFactorCode;

  @JsonKey(
    name: r'twoFactorRecoveryCode',
    required: false,
    includeIfNull: false,
  )
  final String? twoFactorRecoveryCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginRequest &&
          other.email == email &&
          other.password == password &&
          other.twoFactorCode == twoFactorCode &&
          other.twoFactorRecoveryCode == twoFactorRecoveryCode;

  @override
  int get hashCode =>
      email.hashCode +
      password.hashCode +
      (twoFactorCode == null ? 0 : twoFactorCode.hashCode) +
      (twoFactorRecoveryCode == null ? 0 : twoFactorRecoveryCode.hashCode);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
