import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/core/token_storage.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  FutureOr<User?> build() async {
    final token = ref.read(tokenStorageProvider);
    debugPrint("currentUserProvider.build()");

    ref.listen(tokenStorageProvider, (prev, next) async {
      debugPrint(
        [
          "currentUserProvider: tokenStorageProvider",
          "isLoading: ${prev?.isLoading} -> ${next.isLoading}",
          "isReloading: ${prev?.isReloading} -> ${next.isReloading}",
          "isRefreshing: ${prev?.isRefreshing} -> ${next.isRefreshing}",
          "hasError: ${prev?.hasError} -> ${next.hasError}",
          "hasValue: ${prev?.hasValue} -> ${next.hasValue}",
          "value?.tokenHashCode: ${prev?.value?.accessToken.hashCode} -> ${next.value?.accessToken.hashCode}",
        ].join("\n"),
      );

      if (next.value == null) {
        state = const AsyncData(null);
      } else if (prev?.value != next.value) {
        final newUser = await _fetchUser();
        state = AsyncData(newUser);
      }
    });

    if (token.isLoading) {
      state = .data(null);
      return future;
    }
    if (token.value == null) {
      return null;
    }

    return _fetchUser();
  }

  Future<User> _fetchUser() async {
    return ref.callApiConvert(
      (api, ct) => api.getUserApi().getMe(cancelToken: ct),
      User.fromDto,
      "Failed to fetch current user",
    );
  }
}
