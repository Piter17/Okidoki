import 'package:api_bindings/api_bindings.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'received_friend_requests.g.dart';

@riverpod
FutureOr<List<ReceivedRequestDto>> receivedFriendRequests(Ref ref) {
  return ref.callApi(
    (api, ct) => api.getFriendsApi().getReceivedRequestsAsync(cancelToken: ct),
    "Failed to fetch user received friend requests",
  );
}
