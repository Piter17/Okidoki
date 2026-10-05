import 'package:api_bindings/api_bindings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_message.freezed.dart';

@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required int id,
    required int senderId,
    required int chatId,
    required String content,
    required DateTime sent,
    DateTime? modified,
  }) = ChatMessageImpl;
  const factory ChatMessage.skeleton({
    required int id,
    required int senderId,
    required int chatId,
    required String content,
    required DateTime sent,
    DateTime? modified,
  }) = ChatMessageSkeleton;

  static ChatMessage fromDto(ChatMessageDto dto) {
    return ChatMessage(
      id: int.parse(dto.id),
      senderId: int.parse(dto.senderId),
      chatId: int.parse(dto.guildChannelId),
      content: dto.content,
      sent: dto.sendTime.toLocal(),
      modified: dto.modifiedTime?.toLocal(),
    );
  }

  static ChatMessage fake(int seed) {
    return _items[seed % _items.length];
  }

  static final _items = List.generate(10, (index) => ChatMessage.fake(index));
}
