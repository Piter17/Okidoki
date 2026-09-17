import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for GuildsApi
void main() {
  final instance = ApiBindings().getGuildsApi();

  group(GuildsApi, () {
    //Future deleteroleId(int roleId) async
    test('test deleteroleId', () async {
      // TODO
    });

    //Future deleteuserId(int roleId, int userId) async
    test('test deleteuserId', () async {
      // TODO
    });

    //Future<GuildDto> getguildId(int guildId) async
    test('test getguildId', () async {
      // TODO
    });

    //Future<GuildInvitationDto> getinvitationCode(String invitationCode) async
    test('test getinvitationCode', () async {
      // TODO
    });

    //Future<List<GuildDto>> getuser() async
    test('test getuser', () async {
      // TODO
    });

    //Future<GuildProfileDto> patchname(int guildId, { String name }) async
    test('test patchname', () async {
      // TODO
    });

    //Future<GuildDto> postGuilds(CreateGuildRequest createGuildRequest) async
    test('test postGuilds', () async {
      // TODO
    });

    //Future<GuildDto> postaccept(String invitationCode) async
    test('test postaccept', () async {
      // TODO
    });

    //Future<GuildChannelDto> postchannels(int guildId, CreateGuildChannelRequest createGuildChannelRequest) async
    test('test postchannels', () async {
      // TODO
    });

    //Future<GuildProfileDto> postimage(int guildId, { String contentType, String contentDisposition, Map<String, List<String>> headers, int length, String name, String fileName }) async
    test('test postimage', () async {
      // TODO
    });

    //Future<GuildInvitationDto> postinvites(int guildId, CreateGuildInvitationRequest createGuildInvitationRequest) async
    test('test postinvites', () async {
      // TODO
    });

    //Future<GuildRoleDto> postroles(int guildId, CreateGuildRoleRequest createGuildRoleRequest) async
    test('test postroles', () async {
      // TODO
    });

    //Future putuserId(int roleId, int userId) async
    test('test putuserId', () async {
      // TODO
    });
  });
}
