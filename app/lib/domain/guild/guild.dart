import 'package:api_bindings/api_bindings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okidoki/utils/utils.dart';

part 'guild.freezed.dart';

@freezed
sealed class Guild with _$Guild {
  const factory Guild.asMember({
    required int? ownerId,
    required List<GuildRole>? roles,
    required List<GuildChannel>? channels,
    required String? ownerUserName,
    required int? memberCount,
    required int id,
    required String name,
    required int? mainChannelId,
    required String? image,
  }) = GuildAsMember;
  const factory Guild.profile({
    required int id,
    required String name,
    required int? mainChannelId,
    required String? image,
  }) = GuildProfile;

  static GuildAsMember fromDto(GuildDto dto) {
    return GuildAsMember(
      ownerId: dto.ownerId?.toInt(),
      roles: dto.roles?.map(GuildRole.fromDto).toList(),
      channels: dto.channels?.map(GuildChannel.fromDto).toList(),
      ownerUserName: dto.ownerUserName,
      memberCount: dto.memberCount,
      id: dto.id.toInt(),
      name: dto.name,
      mainChannelId: dto.mainChannelId?.toInt(),
      image: dto.image,
    );
  }

  static GuildProfile profileFromDto(GuildProfileDto dto) {
    return GuildProfile(
      id: dto.id.toInt(),
      name: dto.name,
      mainChannelId: dto.mainChannelId?.toInt(),
      image: dto.image,
    );
  }
}

class const GuildRole({
  required final int id,
  required final int guildId,
  required final String name,
  required final int? permissions,
  required final int? color,
}) {
  factory GuildRole.fromDto(GuildRoleDto dto) {
    return GuildRole(
      id: dto.id.toInt(),
      guildId: dto.guildId.toInt(),
      name: dto.name,
      permissions: dto.permissions?.toInt(),
      color: dto.color?.toInt(),
    );
  }
}

class const GuildChannel({
  required final int id,
  required final int guildId,
  required final int? channelGroupId,
  required final String name,
  required final ChannelType? type,
  required final int? orderNumber,
}) {
  factory GuildChannel.fromDto(GuildChannelDto dto) {
    return GuildChannel(
      id: dto.id.toInt(),
      guildId: dto.guildId.toInt(),
      channelGroupId: dto.channelGroupId?.toInt(),
      name: dto.name,
      type: dto.type,
      orderNumber: dto.orderNumber?.toInt(),
    );
  }
}
