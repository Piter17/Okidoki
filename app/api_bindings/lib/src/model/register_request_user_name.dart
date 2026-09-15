//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_user_name.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterRequestUserName {
  /// Returns a new [RegisterRequestUserName] instance.
  RegisterRequestUserName({
    required this.email,
    required this.password,
    required this.userName,
    this.profileName,
  });

  @JsonKey(
    name: r'email',
    required: true,
    includeIfNull: false,
  )
  final String email;

  @JsonKey(
    name: r'password',
    required: true,
    includeIfNull: false,
  )
  final String password;

  @JsonKey(
    name: r'userName',
    required: true,
    includeIfNull: false,
  )
  final String userName;

  @JsonKey(
    name: r'profileName',
    required: false,
    includeIfNull: false,
  )
  final String? profileName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterRequestUserName &&
          other.email == email &&
          other.password == password &&
          other.userName == userName &&
          other.profileName == profileName;

  @override
  int get hashCode =>
      email.hashCode +
      password.hashCode +
      userName.hashCode +
      (profileName == null ? 0 : profileName.hashCode);

  factory RegisterRequestUserName.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestUserNameFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestUserNameToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
