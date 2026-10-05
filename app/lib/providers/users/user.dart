import 'package:api_bindings/api_bindings.dart';
import 'package:flutter/foundation.dart';
import 'package:okidoki/providers/users/current_user.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
FutureOr<UserProfileDto> currentUserProfile(Ref ref) {
  final currentUser = ref.watch(currentUserProvider).requireValue;
  return currentUser != null
      ? ref.watch(userProfileProvider(currentUser.id)).requireValue
      : throw 'asdf';
}

@riverpod
class UserProfile extends _$UserProfile {
  @override
  FutureOr<UserProfileDto> build(int userId) {
    return ref
        .cacheFor(Duration(minutes: 10))
        .callApi(
          (api, ct) => api.getUserProfileApi().getByUserId(
            userId: userId.toString(),
            cancelToken: ct,
          ),
          ("Failed to fetch userProfile ($userId)"),
        );
  }

  void set(UserProfileDto profile) {
    debugPrint("UserProfile($userId) = $profile");
    state = AsyncData(profile);
  }
}

@riverpod
class SkeletonUserProfile extends _$SkeletonUserProfile {
  static final _items = List.generate(
    10,
    (index) => UserProfileDto(
      id: index.toString(),
      userName: TextGen.nick(),
      nickname: TextGen.nick(),
      state: .offline,
      profilePicture: null,
    ),
  );

  @override
  FutureOr<UserProfileDto> build(Key key) async {
    final item = key.hashCode % 10;
    return _items[item];
  }
}
