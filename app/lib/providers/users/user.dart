import 'package:flutter/foundation.dart';
import 'package:okidoki/domain/domain.dart' as domain;
import 'package:okidoki/providers/auth/current_user.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
FutureOr<domain.UserProfile> currentUserProfile(Ref ref) {
  final currentUser = ref.watch(currentUserProvider).requireValue;
  return currentUser != null
      ? ref.watch(userProfileProvider(currentUser.id)).requireValue
      : throw 'asdf';
}

@riverpod
class UserProfile extends _$UserProfile {
  @override
  FutureOr<domain.UserProfile> build(int userId) {
    return ref
        .cacheFor(Duration(minutes: 10))
        .callApiConvert(
          (api, ct) => api.getUserProfileApi().getByUserId(
            userId: userId.toString(),
            cancelToken: ct,
          ),
          domain.UserProfile.fromDto,
          ("Failed to fetch userProfile ($userId)"),
        );
  }

  void set(domain.UserProfile profile) {
    debugPrint("UserProfile($userId) = $profile");
    state = AsyncData(profile);
  }
}

@riverpod
class SkeletonUserProfile extends _$SkeletonUserProfile {
  @override
  FutureOr<domain.UserProfile> build(Key key) async {
    return domain.UserProfile.fake(key.hashCode % 10);
  }
}
