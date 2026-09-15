import 'package:riv/mutations/mutations.dart';
import 'package:riv/utils/utils.dart';

class FriendMutations {
  static Mutation<void> getSendInviteById() => Mutation<void>();
  static MutationCallback<void> sendInviteByIdCb(String id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().sendRequestById(userId: id),
        errorText: "",
      );

  static Mutation<void> getSendInvite() => Mutation<void>();
  static MutationCallback<void> sendInviteCb(String username) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().sendRequestByUsername(username: username),
        errorText: "",
      );
  static Mutation<void> getAcceptInvite() => Mutation<void>();
  static MutationCallback<void> acceptInviteCb(String id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().acceptRequest(senderId: id),
        errorText: "",
      );

  static Mutation<void> getDeclineInvite() => Mutation<void>();
  static MutationCallback<void> declineInviteCb(String id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().declineRequest(senderId: id),
        errorText: "",
      );

  static Mutation<void> getRevokeFriendInvite() => Mutation<void>();
  static MutationCallback<void> revokeFriendInviteCb(String id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().revokeRequest(targetId: id),
        errorText: "",
      );
}
