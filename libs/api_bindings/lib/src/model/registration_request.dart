//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'registration_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegistrationRequest {
  /// Returns a new [RegistrationRequest] instance.
  RegistrationRequest({
    required this.email,

    required this.password,

    required this.profileName,

    required this.guildInvitationCode,
  });

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'password', required: true, includeIfNull: false)
  final String password;

  @JsonKey(name: r'profileName', required: true, includeIfNull: false)
  final String profileName;

  @JsonKey(name: r'guildInvitationCode', required: true, includeIfNull: true)
  final String? guildInvitationCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationRequest &&
          other.email == email &&
          other.password == password &&
          other.profileName == profileName &&
          other.guildInvitationCode == guildInvitationCode;

  @override
  int get hashCode =>
      email.hashCode +
      password.hashCode +
      profileName.hashCode +
      (guildInvitationCode == null ? 0 : guildInvitationCode.hashCode);

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
