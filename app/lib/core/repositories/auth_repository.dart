import 'package:api_bindings/api_bindings.dart';
import 'package:okidoki/core/repositories/base_repository.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) => AuthRepository(ref);

class AuthRepository extends BaseRepository {
  AuthRepository(super.ref);

  Future<void> addCredentials(AddCredentialsRequest request) async {
    return ref
        .callApi(
          (x, ct) => x.getAuthApi().addCredentials(
            addCredentialsRequest: request,
          ),
          "Failed to add credentials",
        )
        .then(
          (_) => ref.invalidate(currentUserProvider),
        );
  }
}
