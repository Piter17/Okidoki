import 'package:api_bindings/api_bindings.dart';
import 'package:flutter/foundation.dart';
import 'package:riv/providers/users/current_user.dart';
import 'package:riv/utils/riverpod_extensions.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
FutureOr<UserProfileDto> currentUserProfile(Ref ref) {
  final currentUser = ref.watch(currentUserProvider).requireValue;
  return currentUser != null
      ? ref.watch(userProfileProvider(currentUser.userId)).requireValue
      : throw 'asdf';
}

@riverpod
class UserProfile extends _$UserProfile {
  @override
  FutureOr<UserProfileDto> build(String userId) {
    return ref
        .cacheFor(Duration(minutes: 10))
        .callApi(
          (api, ct) => api.getUserProfileApi().getByUserId(
            userId: userId,
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

// @riverpod
// FutureOr<UserProfileDto> userProfile(Ref ref, {int? userId, int? guildId}) {
//   if (userId == null) {
//     final uid = ref.watch(currentUserProvider).requireValue!.userId;
//     return ref.watch(userProfileProvider(userId: uid)).requireValue;
//   }
//   return ref
//       .cacheFor(Duration(minutes: 10))
//       .callApi(
//         (api, ct) => api.getUserProfileApi().getGetuserprofile(
//           userId: userId,
//           guildId: guildId,
//           cancelToken: ct,
//         ),
//         ("Failed to fetch userProfile ($userId, $guildId)"),
//       );
// }
