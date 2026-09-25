//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/guild_profile_dto.dart';
import 'package:api_bindings/src/model/user_profile_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_invitation_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GuildInvitationDto {
  /// Returns a new [GuildInvitationDto] instance.
  GuildInvitationDto({
    required this.id,

    required this.guild,

    this.code,

    this.createdBy,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'guild', required: true, includeIfNull: false)
  final GuildProfileDto guild;

  @JsonKey(name: r'code', required: false, includeIfNull: false)
  final String? code;

  @JsonKey(name: r'createdBy', required: false, includeIfNull: false)
  final UserProfileDto? createdBy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildInvitationDto &&
          other.id == id &&
          other.guild == guild &&
          other.code == code &&
          other.createdBy == createdBy;

  @override
  int get hashCode =>
      id.hashCode + guild.hashCode + code.hashCode + createdBy.hashCode;

  factory GuildInvitationDto.fromJson(Map<String, dynamic> json) =>
      _$GuildInvitationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildInvitationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
