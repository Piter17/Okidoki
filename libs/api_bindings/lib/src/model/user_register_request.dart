//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserRegisterRequest {
  /// Returns a new [UserRegisterRequest] instance.
  UserRegisterRequest({
    required this.email,

    this.userName,

    required this.password,

    required this.profileName,
  });

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'userName', required: false, includeIfNull: false)
  final String? userName;

  @JsonKey(name: r'password', required: true, includeIfNull: false)
  final String password;

  @JsonKey(name: r'profileName', required: true, includeIfNull: false)
  final String profileName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRegisterRequest &&
          other.email == email &&
          other.userName == userName &&
          other.password == password &&
          other.profileName == profileName;

  @override
  int get hashCode =>
      email.hashCode +
      (userName == null ? 0 : userName.hashCode) +
      password.hashCode +
      profileName.hashCode;

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
