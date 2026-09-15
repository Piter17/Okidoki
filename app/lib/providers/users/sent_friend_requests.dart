import 'package:api_bindings/api_bindings.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sent_friend_requests.g.dart';

@riverpod
FutureOr<List<SentRequestDto>> sentFriendRequests(Ref ref) {
  return ref.callApi(
    (api, ct) => api.getFriendsApi().getSentRequestsAsync(cancelToken: ct),
    "Failed to fetch user sent friend requests",
  );
}
