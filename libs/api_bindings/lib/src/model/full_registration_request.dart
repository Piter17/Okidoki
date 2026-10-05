//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'full_registration_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FullRegistrationRequest {
  /// Returns a new [FullRegistrationRequest] instance.
  FullRegistrationRequest({
    required this.profileName,

    required this.email,

    required this.password,
  });

  @JsonKey(name: r'profileName', required: true, includeIfNull: false)
  final String profileName;

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'password', required: true, includeIfNull: false)
  final String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FullRegistrationRequest &&
          other.profileName == profileName &&
          other.email == email &&
          other.password == password;

  @override
  int get hashCode => profileName.hashCode + email.hashCode + password.hashCode;

  factory FullRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$FullRegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FullRegistrationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
