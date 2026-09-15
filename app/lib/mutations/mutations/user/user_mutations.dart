import 'package:api_bindings/api_bindings.dart';
import 'package:riv/core/core.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/utils/utils.dart';

class UserMutations {
  static Mutation getChangeName() => Mutation();
  static MutationCallback<void> changeName(String username) =>
      (tsx) => tsx.callApi(
        (x) => x.getUserApi().updateUsername(username: username),
        errorText: "",
      );

  static Mutation getChangeProfileName() => Mutation();
  static MutationCallback<void> changeProfileName(String profileName) =>
      (tsx) => tsx.callApi(
        (x) => x.getUserProfileApi().updateProfile(
          updateUserProfileRequest: UpdateUserProfileRequest(
            profileName: profileName,
          ),
        ),
        errorText: "",
      );

  static Mutation getChangeProfilePicture() => Mutation();
  static MutationCallback<UserProfileDto> changeProfilePicture(
    FileContent image,
  ) =>
      (tsx) => tsx.callApi(
        (x) => x.getUserProfileApi().updateAvatar(
          avatar: image.toDio(),
        ),
        errorText: "",
      );

  static MutationCallback<void> declineInvite(String id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().declineRequest(senderId: id),
        errorText: "",
      );

  static MutationCallback<void> revokeFriendInvite(String id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().revokeRequest(targetId: id),
        errorText: "",
      );
}
