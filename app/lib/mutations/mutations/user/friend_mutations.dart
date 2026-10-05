import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/utils/utils.dart';

class FriendMutations {
  static Mutation<void> getSendInviteById() => Mutation<void>();
  static MutationCallback<void> sendInviteByIdCb(int id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().sendRequestById(userId: id.toString()),
        errorText: "",
      );

  static Mutation<void> getSendInvite() => Mutation<void>();
  static MutationCallback<void> sendInviteCb(String username) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().sendRequestByUsername(username: username),
        errorText: "",
      );
  static Mutation<void> getAcceptInvite() => Mutation<void>();
  static MutationCallback<void> acceptInviteCb(int id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().acceptRequest(senderId: id.toString()),
        errorText: "",
      );

  static Mutation<void> getDeclineInvite() => Mutation<void>();
  static MutationCallback<void> declineInviteCb(int id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().declineRequest(senderId: id.toString()),
        errorText: "",
      );

  static Mutation<void> getRevokeFriendInvite() => Mutation<void>();
  static MutationCallback<void> revokeFriendInviteCb(int id) =>
      (tsx) => tsx.callApi(
        (x) => x.getFriendsApi().revokeRequest(targetId: id.toString()),
        errorText: "",
      );
}
