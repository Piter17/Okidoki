import 'package:api_bindings/api_bindings.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages.g.dart';

@riverpod
FutureOr<List<ChatMessageDto>> messages(
  Ref ref,
  String chatId,
  String? pdx, [
  QueryDirection direction = .prev,
]) => ref.callApi(
  ((api, ct) => api.getChatApi().getMessages(
    guildChannelId: chatId,
    cursor: pdx,
    direction: direction,
    cancelToken: ct,
  )),
  "Failed to fetch messages ($chatId, $pdx)",
);
