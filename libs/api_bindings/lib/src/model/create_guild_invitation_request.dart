//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_guild_invitation_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateGuildInvitationRequest {
  /// Returns a new [CreateGuildInvitationRequest] instance.
  CreateGuildInvitationRequest({this.validUntil, this.maxUses});

  @JsonKey(name: r'validUntil', required: false, includeIfNull: false)
  final DateTime? validUntil;

  @JsonKey(name: r'maxUses', required: false, includeIfNull: false)
  final int? maxUses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateGuildInvitationRequest &&
          other.validUntil == validUntil &&
          other.maxUses == maxUses;

  @override
  int get hashCode =>
      (validUntil == null ? 0 : validUntil.hashCode) +
      (maxUses == null ? 0 : maxUses.hashCode);

  factory CreateGuildInvitationRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGuildInvitationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGuildInvitationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
