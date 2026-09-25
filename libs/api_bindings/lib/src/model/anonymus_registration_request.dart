//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anonymus_registration_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AnonymusRegistrationRequest {
  /// Returns a new [AnonymusRegistrationRequest] instance.
  AnonymusRegistrationRequest({
    required this.profileName,

    required this.guildInvitationCode,
  });

  @JsonKey(name: r'profileName', required: true, includeIfNull: false)
  final String profileName;

  @JsonKey(name: r'guildInvitationCode', required: true, includeIfNull: true)
  final String? guildInvitationCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnonymusRegistrationRequest &&
          other.profileName == profileName &&
          other.guildInvitationCode == guildInvitationCode;

  @override
  int get hashCode =>
      profileName.hashCode +
      (guildInvitationCode == null ? 0 : guildInvitationCode.hashCode);

  factory AnonymusRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$AnonymusRegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnonymusRegistrationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
