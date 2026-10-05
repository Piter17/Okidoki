import 'package:okidoki/utils/riverpod_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:okidoki/domain/domain.dart' as domain;

part 'guild.g.dart';

@Riverpod()
class Guild extends _$Guild {
  @override
  FutureOr<domain.Guild> build(int id) async => await ref
      .cacheFor(const Duration(hours: 12))
      .callApiConvert(
        (api, ct) => api.getGuildsApi().getGuildById(
          guildId: id.toString(),
          cancelToken: ct,
        ),
        domain.Guild.fromDto,
        "Failed to fetch guild ($id)",
      );

  void updateProfile(domain.Guild profile) => state.hasValue == false
      ? null
      : state = AsyncData(
          state.value!.copyWith(
            name: profile.name,
            image: profile.image,
            mainChannelId: profile.mainChannelId,
          ),
        );

  void addChannel(domain.GuildChannel channel) {
    final guild = state.value;
    if (guild is domain.GuildAsMember) {
      state = .data(
        guild.copyWith(channels: [...guild.channels!, channel]),
      );
    }
  }

  void removeChannel(int channelId) {
    final guild = state.value;
    if (guild is domain.GuildAsMember) {
      state = .data(
        guild.copyWith(
          channels: guild.channels!.where((x) => x.id != channelId).toList(),
        ),
      );
    }
  }
}
