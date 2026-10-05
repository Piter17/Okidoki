//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/guild_channel_dto.dart';
import 'package:api_bindings/src/model/guild_role_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GuildDto {
  /// Returns a new [GuildDto] instance.
  GuildDto({
    this.ownerId,

    this.roles,

    this.channels,

    this.ownerUserName,

    this.memberCount,

    required this.id,

    required this.name,

    this.mainChannelId,

    this.image,
  });

  @JsonKey(name: r'ownerId', required: false, includeIfNull: false)
  final String? ownerId;

  @JsonKey(name: r'roles', required: false, includeIfNull: false)
  final List<GuildRoleDto>? roles;

  @JsonKey(name: r'channels', required: false, includeIfNull: false)
  final List<GuildChannelDto>? channels;

  @JsonKey(name: r'ownerUserName', required: false, includeIfNull: false)
  final String? ownerUserName;

  @JsonKey(name: r'memberCount', required: false, includeIfNull: false)
  final int? memberCount;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'mainChannelId', required: false, includeIfNull: false)
  final String? mainChannelId;

  @JsonKey(name: r'image', required: false, includeIfNull: false)
  final String? image;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildDto &&
          other.ownerId == ownerId &&
          other.roles == roles &&
          other.channels == channels &&
          other.ownerUserName == ownerUserName &&
          other.memberCount == memberCount &&
          other.id == id &&
          other.name == name &&
          other.mainChannelId == mainChannelId &&
          other.image == image;

  @override
  int get hashCode =>
      ownerId.hashCode +
      roles.hashCode +
      channels.hashCode +
      ownerUserName.hashCode +
      memberCount.hashCode +
      id.hashCode +
      name.hashCode +
      (mainChannelId == null ? 0 : mainChannelId.hashCode) +
      (image == null ? 0 : image.hashCode);

  factory GuildDto.fromJson(Map<String, dynamic> json) =>
      _$GuildDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
