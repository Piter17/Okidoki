// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageCWProxy {
  ChatMessage id(int? id);

  ChatMessage guildChannelId(int? guildChannelId);

  ChatMessage senderId(int? senderId);

  ChatMessage sendTime(DateTime? sendTime);

  ChatMessage modifiedTime(DateTime? modifiedTime);

  ChatMessage content(String content);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChatMessage(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatMessage(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatMessage call({
    int? id,
    int? guildChannelId,
    int? senderId,
    DateTime? sendTime,
    DateTime? modifiedTime,
    String content,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatMessage.copyWith(...)` or call `instanceOfChatMessage.copyWith.fieldName(value)` for a single field.
class _$ChatMessageCWProxyImpl implements _$ChatMessageCWProxy {
  const _$ChatMessageCWProxyImpl(this._value);

  final ChatMessage _value;

  @override
  ChatMessage id(int? id) => call(id: id);

  @override
  ChatMessage guildChannelId(int? guildChannelId) =>
      call(guildChannelId: guildChannelId);

  @override
  ChatMessage senderId(int? senderId) => call(senderId: senderId);

  @override
  ChatMessage sendTime(DateTime? sendTime) => call(sendTime: sendTime);

  @override
  ChatMessage modifiedTime(DateTime? modifiedTime) =>
      call(modifiedTime: modifiedTime);

  @override
  ChatMessage content(String content) => call(content: content);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChatMessage(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatMessage(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatMessage call({
    Object? id = const $CopyWithPlaceholder(),
    Object? guildChannelId = const $CopyWithPlaceholder(),
    Object? senderId = const $CopyWithPlaceholder(),
    Object? sendTime = const $CopyWithPlaceholder(),
    Object? modifiedTime = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
  }) {
    return ChatMessage(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      guildChannelId: guildChannelId == const $CopyWithPlaceholder()
          ? _value.guildChannelId
          // ignore: cast_nullable_to_non_nullable
          : guildChannelId as int?,
      senderId: senderId == const $CopyWithPlaceholder()
          ? _value.senderId
          // ignore: cast_nullable_to_non_nullable
          : senderId as int?,
      sendTime: sendTime == const $CopyWithPlaceholder()
          ? _value.sendTime
          // ignore: cast_nullable_to_non_nullable
          : sendTime as DateTime?,
      modifiedTime: modifiedTime == const $CopyWithPlaceholder()
          ? _value.modifiedTime
          // ignore: cast_nullable_to_non_nullable
          : modifiedTime as DateTime?,
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
    );
  }
}

extension $ChatMessageCopyWith on ChatMessage {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatMessage.copyWith(...)` or `instanceOfChatMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageCWProxy get copyWith => _$ChatMessageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChatMessage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['content']);
      final val = ChatMessage(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        guildChannelId: $checkedConvert(
          'guildChannelId',
          (v) => (v as num?)?.toInt(),
        ),
        senderId: $checkedConvert('senderId', (v) => (v as num?)?.toInt()),
        sendTime: $checkedConvert(
          'sendTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        modifiedTime: $checkedConvert(
          'modifiedTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        content: $checkedConvert('content', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'guildChannelId': ?instance.guildChannelId,
      'senderId': ?instance.senderId,
      'sendTime': ?instance.sendTime?.toIso8601String(),
      'modifiedTime': ?instance.modifiedTime?.toIso8601String(),
      'content': instance.content,
    };
