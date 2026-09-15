import 'package:api_bindings/api_bindings.dart';
import 'package:riv/utils/riverpod_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guilds.g.dart';

@Riverpod()
class Guilds extends _$Guilds {
  @override
  FutureOr<List<GuildProfileDto>> build() async => await ref.callApi(
    (api, ct) => api.getGuildsApi().getGuildsForUser(), //cancelToken: ct),
    "Failed to fetch guilds for current user",
  );

  void add(GuildProfileDto guild) {
    final newList = [guild, ...state.requireValue];
    state = AsyncData(newList);
  }

  void remove(String guildId) {
    var newList = state.requireValue.where((x) => x.id != guildId).toList();
    state = AsyncData(newList);
  }
}
