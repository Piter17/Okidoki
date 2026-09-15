//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_ex.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterRequestEx {
  /// Returns a new [RegisterRequestEx] instance.
  RegisterRequestEx({
    this.email,

    this.userName,

    this.password,

    this.profileName,
  });

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  @JsonKey(name: r'userName', required: false, includeIfNull: false)
  final String? userName;

  @JsonKey(name: r'password', required: false, includeIfNull: false)
  final String? password;

  @JsonKey(name: r'profileName', required: false, includeIfNull: false)
  final String? profileName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterRequestEx &&
          other.email == email &&
          other.userName == userName &&
          other.password == password &&
          other.profileName == profileName;

  @override
  int get hashCode =>
      email.hashCode +
      userName.hashCode +
      password.hashCode +
      (profileName == null ? 0 : profileName.hashCode);

  factory RegisterRequestEx.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestExFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestExToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
