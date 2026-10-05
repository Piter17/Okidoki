import 'package:okidoki/domain/user/user.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_users.g.dart';

@riverpod
class GuildUsers extends _$GuildUsers {
  @override
  Future<List<UserProfile>> build(int guildId) async => ref.callApiConvertAll(
    (f, ct) => f.getGuildsApi().getUserList(guildId: guildId.toString()),
    UserProfile.fromDto,
    "Failed to fetch guild users for guild ID $guildId",
  );
}
