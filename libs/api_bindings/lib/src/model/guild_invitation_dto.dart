//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
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

    required this.guildId,

    this.code,

    this.validUntil,

    this.maxUses,

    this.createdById,

    this.createdByUserName,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'guildId', required: true, includeIfNull: false)
  final String guildId;

  @JsonKey(name: r'code', required: false, includeIfNull: false)
  final String? code;

  @JsonKey(name: r'validUntil', required: false, includeIfNull: false)
  final DateTime? validUntil;

  @JsonKey(name: r'maxUses', required: false, includeIfNull: false)
  final int? maxUses;

  @JsonKey(name: r'createdById', required: false, includeIfNull: false)
  final String? createdById;

  @JsonKey(name: r'createdByUserName', required: false, includeIfNull: false)
  final String? createdByUserName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildInvitationDto &&
          other.id == id &&
          other.guildId == guildId &&
          other.code == code &&
          other.validUntil == validUntil &&
          other.maxUses == maxUses &&
          other.createdById == createdById &&
          other.createdByUserName == createdByUserName;

  @override
  int get hashCode =>
      id.hashCode +
      guildId.hashCode +
      code.hashCode +
      (validUntil == null ? 0 : validUntil.hashCode) +
      (maxUses == null ? 0 : maxUses.hashCode) +
      createdById.hashCode +
      createdByUserName.hashCode;

  factory GuildInvitationDto.fromJson(Map<String, dynamic> json) =>
      _$GuildInvitationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildInvitationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
