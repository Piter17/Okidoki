import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for FriendsApi
void main() {
  final instance = ApiBindings().getFriendsApi();

  group(FriendsApi, () {
    //Future<List<FriendDto>> getFriends() async
    test('test getFriends', () async {
      // TODO
    });

    //Future<List<FriendRequestDto>> getinvites() async
    test('test getinvites', () async {
      // TODO
    });

    //Future<List<FriendRequestDto>> getrequests() async
    test('test getrequests', () async {
      // TODO
    });

    //Future<FriendRequestDto> postsendInvite({ String username }) async
    test('test postsendInvite', () async {
      // TODO
    });

    //Future<FriendRequestDto> postsendInviteById({ int userId }) async
    test('test postsendInviteById', () async {
      // TODO
    });

    //Future putacceptRequest({ int senderId }) async
    test('test putacceptRequest', () async {
      // TODO
    });

    //Future putdeclineRequest({ int senderId }) async
    test('test putdeclineRequest', () async {
      // TODO
    });

    //Future putrevokeRequest({ int targetId }) async
    test('test putrevokeRequest', () async {
      // TODO
    });
  });
}
