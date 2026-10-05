import 'package:api_bindings/api_bindings.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/utils/utils.dart';

class ChatMutations {
  static Mutation<ChatMessageDto> getSendMessage() =>
      Mutation<ChatMessageDto>();
  static MutationCallback<ChatMessageDto> sendMessageCb({
    required String chatId,
    required String content,
  }) =>
      (tsx) => tsx.callApi(
        (x) => x.getChatApi().sendMessage(
          guildChannelId: chatId,
          createChatMessageRequest: CreateChatMessageRequest(
            content: content,
          ),
        ),
        errorText: "Failed to send message to chat $chatId",
      );

  static Mutation<ChatMessageDto> getEditMessage() =>
      Mutation<ChatMessageDto>();
  static MutationCallback<ChatMessageDto> editMessageCb({
    required String messageId,
    required String content,
  }) =>
      (tsx) => tsx.callApi(
        (x) => x.getChatApi().editMessage(
          messageId: messageId,
          updateChatMessageRequest: UpdateChatMessageRequest(
            content: content,
          ),
        ),
        errorText: "Failed to edit message $messageId",
      );

  static Mutation<void> getDeleteMessage() => Mutation<void>();
  static MutationCallback<void> deleteMessageCb({
    required int messageId,
  }) =>
      (tsx) => tsx.callApi(
        (x) => x.getChatApi().deleteMessage(messageId: messageId.toString()),
        errorText: "Failed to delete message $messageId",
      );
}
