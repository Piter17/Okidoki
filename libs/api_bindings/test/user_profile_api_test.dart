import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for UserProfileApi
void main() {
  final instance = ApiBindings().getUserProfileApi();

  group(UserProfileApi, () {
    //Future<UserProfileDto> getUserProfile({ int guildId }) async
    test('test getUserProfile', () async {
      // TODO
    });

    //Future<List<UserProfileDto>> getall() async
    test('test getall', () async {
      // TODO
    });

    //Future<UserProfileDto> patchprofile(UpdateUserProfileRequest updateUserProfileRequest) async
    test('test patchprofile', () async {
      // TODO
    });

    //Future patchusername({ String username }) async
    test('test patchusername', () async {
      // TODO
    });

    //Future<UserProfileDto> postUserProfile(CreateUserProfileRequest createUserProfileRequest) async
    test('test postUserProfile', () async {
      // TODO
    });

    //Future<UserProfileDto> postavatar({ MultipartFile avatar }) async
    test('test postavatar', () async {
      // TODO
    });
  });
}
