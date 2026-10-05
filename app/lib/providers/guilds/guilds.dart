import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/utils/riverpod_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guilds.g.dart';

@Riverpod()
class Guilds extends _$Guilds {
  @override
  FutureOr<List<Guild>> build() => ref.callApiConvertAll(
    (api, ct) => api.getGuildsApi().getGuildsForUser(), //cancelToken: ct),
    Guild.profileFromDto,
    "Failed to fetch guilds for current user",
  );

  void add(GuildProfile guild) {
    final newList = [guild, ...state.requireValue];
    state = AsyncData(newList);
  }

  void remove(int guildId) {
    var newList = state.requireValue.where((x) => x.id != guildId).toList();
    state = AsyncData(newList);
  }
}
