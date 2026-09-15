import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';


/// tests for GuildApi
void main() {
  final instance = ApiBindings().getGuildApi();

  group(GuildApi, () {
    //Future deleteroleid(int roleId) async
    test('test deleteroleid', () async {
      // TODO
    });

    //Future deleteuserid(int userId, int roleId) async
    test('test deleteuserid', () async {
      // TODO
    });

    //Future<GuildDto> getGetguild({ int id }) async
    test('test getGetguild', () async {
      // TODO
    });

    //Future<List<GuildProfileDto>> getGetguilds() async
    test('test getGetguilds', () async {
      // TODO
    });

    //Future<GuildProfileDto> getGetinvitation({ String invitationCode }) async
    test('test getGetinvitation', () async {
      // TODO
    });

    //Future<GuildProfileDto> patchUpdateimage(int guildId, { MultipartFile image }) async
    test('test patchUpdateimage', () async {
      // TODO
    });

    //Future<GuildProfileDto> patchUpdatename(int guildId, { String name }) async
    test('test patchUpdatename', () async {
      // TODO
    });

    //Future<GuildDto> postAcceptinvitation({ String invitationCode }) async
    test('test postAcceptinvitation', () async {
      // TODO
    });

    //Future<GuildChannelDto> postCreatechannel({ int guildId, int groupId, String name, ChannelType type }) async
    test('test postCreatechannel', () async {
      // TODO
    });

    //Future<GuildDto> postCreateguild({ String name, MultipartFile image }) async
    test('test postCreateguild', () async {
      // TODO
    });

    //Future<GuildInvitationDto> postCreateinvitation({ int guildId, int maxUses, DateTime validUntil }) async
    test('test postCreateinvitation', () async {
      // TODO
    });

    //Future<GuildRoleDto> postRole({ int guildId, String name }) async
    test('test postRole', () async {
      // TODO
    });

    //Future putroleid(int roleId, { int userId }) async
    test('test putroleid', () async {
      // TODO
    });

  });
}
