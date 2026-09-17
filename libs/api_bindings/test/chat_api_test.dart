import 'package:test/test.dart';
import 'package:api_bindings/api_bindings.dart';

/// tests for ChatApi
void main() {
  final instance = ApiBindings().getChatApi();

  group(ChatApi, () {
    //Future deletemessageId(int messageId) async
    test('test deletemessageId', () async {
      // TODO
    });

    //Future<List<ChatMessageDto>> getguildChannelId(int guildChannelId) async
    test('test getguildChannelId', () async {
      // TODO
    });

    //Future<ChatMessageDto> patchmessageId(int messageId, CreateChatMessageRequest createChatMessageRequest) async
    test('test patchmessageId', () async {
      // TODO
    });

    //Future<ChatMessageDto> postguildChannelId(int guildChannelId, CreateChatMessageRequest createChatMessageRequest) async
    test('test postguildChannelId', () async {
      // TODO
    });
  });
}
