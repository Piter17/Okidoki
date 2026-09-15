import 'package:api_bindings/api_bindings.dart';
import 'package:riv/utils/riverpod_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild.g.dart';

@Riverpod()
class Guild extends _$Guild {
  @override
  FutureOr<GuildDto> build(String id) => ref
      .cacheFor(const Duration(hours: 12))
      .callApi(
        (api, ct) =>
            api.getGuildsApi().getGuildById(guildId: id, cancelToken: ct),
        "Failed to fetch guild ($id)",
      );

  void updateProfile(GuildProfileDto profile) => state.hasValue == false
      ? null
      : state = AsyncData(
          state.value!.copyWith(
            name: profile.name,
            image: profile.image,
          ),
        );

  void addChannel(GuildChannelDto channel) => state.hasValue == false
      ? null
      : state = .data(
          state.value!.copyWith(channels: [...state.value!.channels!, channel]),
        );

  void removeChannel(String channelId) => state.hasValue == false
      ? null
      : state = .data(
          state.value!.copyWith(
            channels: state.value!.channels!
                .where((x) => x.id != channelId)
                .toList(),
          ),
        );
}
