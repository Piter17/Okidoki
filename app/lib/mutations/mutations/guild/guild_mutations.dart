import 'package:api_bindings/api_bindings.dart';
import 'package:riv/core/core.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/utils/utils.dart';

class GuildMutations {
  static Mutation<GuildDto> getCreate() => Mutation<GuildDto>();
  static MutationCallback<GuildDto> createCb({
    required String name,
    FileContent? image,
  }) =>
      (tsx) => tsx.callApi(
        (x) => x.getGuildsApi().createGuild(
          name: name,
          image: image?.toDio(),
        ),
        errorText: "Failed to create guild",
      );

  static Mutation<GuildDto> getJoin() => Mutation<GuildDto>();
  static MutationCallback<GuildDto> joinCb({
    required String code,
  }) =>
      (tsx) => tsx.callApi(
        (f) => f.getGuildsApi().acceptInvitation(
          invitationCode: code,
        ),
        errorText: "Failed to join guild using ivitation $code",
      );

  static Mutation<GuildChannelDto> getCreateChannel() =>
      Mutation<GuildChannelDto>();
  static MutationCallback<GuildChannelDto> createChannelCb({
    required String guildId,
    required String name,
  }) =>
      (tsx) => tsx.callApi(
        (x) => x.getGuildsApi().createChannel(
          guildId: guildId,
          createGuildChannelRequest: CreateGuildChannelRequest(
            name: name,
            type: .text,
          ),
        ),
        errorText: "Failed to create channel in guild $guildId",
      );

  static Mutation<void> getRemoveChannel() => Mutation<void>();
  static MutationCallback<void> removeChannelCb({
    required String guildId,
    required String channelId,
  }) =>
      (tsx) => tsx.callApi(
        (x) => x.getGuildsApi().removeChannel(
          guildId: guildId,
          channelId: channelId,
        ),
        errorText: "Failed to remove channel $channelId in guild $guildId",
      );

  static Mutation<GuildProfileDto> getUpdateImage() =>
      Mutation<GuildProfileDto>();
  static MutationCallback<GuildProfileDto> updateImageCb({
    required String guildId,
    required FileContent image,
  }) =>
      (tsx) => tsx.callApi(
        (a) => a.getGuildsApi().updateImage(
          guildId: guildId,
          image: image.toDio(),
        ),
        errorText: "Failed to update image for guild $guildId",
      );

  static Mutation<GuildProfileDto> getUpdateName() =>
      Mutation<GuildProfileDto>();
  static MutationCallback<GuildProfileDto> updateNameCb({
    required String guildId,
    required String name,
  }) =>
      (tsx) => tsx.callApi(
        (a) => a.getGuildsApi().updateName(
          guildId: guildId,
          updateGuildNameRequest: UpdateGuildNameRequest(
            name: name,
          ),
        ),
        errorText: "Failed to update name for guild $guildId",
      );

  static Mutation<GuildInvitationDto> getCreateInvite() =>
      Mutation<GuildInvitationDto>();
  static MutationCallback<GuildInvitationDto> createInviteCb({
    required String guildId,
  }) =>
      (tsx) => tsx.callApi(
        (a) => a.getGuildsApi().createInvitation(guildId: guildId),
        errorText: "Failed to create invite for guild $guildId",
      );
}
