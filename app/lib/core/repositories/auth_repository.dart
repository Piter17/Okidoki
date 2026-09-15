import 'package:riv/core/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository ingRepository(Ref ref) => AuthRepository(ref);

class AuthRepository extends BaseRepository {
  AuthRepository(super.ref);
}
