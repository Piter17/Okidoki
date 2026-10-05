import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'received_friend_requests.g.dart';

@riverpod
FutureOr<List<ReceivedRequest>> receivedFriendRequests(Ref ref) {
  return ref.callApiConvertAll(
    (api, ct) => api.getFriendsApi().getReceivedRequestsAsync(cancelToken: ct),
    ReceivedRequest.fromDto,
    "Failed to fetch user received friend requests",
  );
}
