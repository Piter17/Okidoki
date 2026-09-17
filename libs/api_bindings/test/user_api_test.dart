import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for UserApi
void main() {
  final instance = ApiBindings().getUserApi();

  group(UserApi, () {
    //Future<IdentityDto> getMe() async
    test('test getMe', () async {
      // TODO
    });

    //Future setUserName({ String username }) async
    test('test setUserName', () async {
      // TODO
    });
  });
}
