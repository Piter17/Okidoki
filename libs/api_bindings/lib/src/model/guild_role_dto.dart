//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_role_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GuildRoleDto {
  /// Returns a new [GuildRoleDto] instance.
  GuildRoleDto({
    required this.id,

    required this.guildId,

    required this.name,

    this.permissions,

    this.color,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'guildId', required: true, includeIfNull: false)
  final String guildId;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'permissions', required: false, includeIfNull: false)
  final int? permissions;

  @JsonKey(name: r'color', required: false, includeIfNull: false)
  final int? color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildRoleDto &&
          other.id == id &&
          other.guildId == guildId &&
          other.name == name &&
          other.permissions == permissions &&
          other.color == color;

  @override
  int get hashCode =>
      id.hashCode +
      guildId.hashCode +
      name.hashCode +
      permissions.hashCode +
      (color == null ? 0 : color.hashCode);

  factory GuildRoleDto.fromJson(Map<String, dynamic> json) =>
      _$GuildRoleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildRoleDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
