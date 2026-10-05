import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sent_friend_requests.g.dart';

@riverpod
FutureOr<List<SentRequest>> sentFriendRequests(Ref ref) {
  return ref.callApiConvertAll(
    (api, ct) => api.getFriendsApi().getSentRequestsAsync(cancelToken: ct),
    SentRequest.fromDto,
    "Failed to fetch user sent friend requests",
  );
}
