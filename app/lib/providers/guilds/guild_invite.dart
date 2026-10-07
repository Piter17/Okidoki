import 'package:okidoki/domain/guild/guild.dart';
import 'package:okidoki/utils/riverpod_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_invite.g.dart';

@riverpod
class GuildInvite extends _$GuildInvite {
  @override
  FutureOr<GuildInvitation> build(String guildInvitationCode) {
    return ref
        .cacheFor(const Duration(minutes: 5))
        .callApiConvert(
          (api, ct) => api.getGuildsApi().getInvitation(
            invitationCode: guildInvitationCode,
            cancelToken: ct,
          ),
          GuildInvitation.fromDto,
          "Failed to fetch guild invitation $guildInvitationCode",
        );
  }
}
