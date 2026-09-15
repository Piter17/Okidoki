// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageDtoCWProxy {
  ChatMessageDto id(String id);

  ChatMessageDto guildChannelId(String guildChannelId);

  ChatMessageDto senderId(String senderId);

  ChatMessageDto senderUserName(String? senderUserName);

  ChatMessageDto content(String content);

  ChatMessageDto sendTime(DateTime? sendTime);

  ChatMessageDto modifiedTime(DateTime? modifiedTime);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChatMessageDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatMessageDto(...).copyWith(id: 12, name: "My name")
  /// ```
  ChatMessageDto call({
    String id,
    String guildChannelId,
    String senderId,
    String? senderUserName,
    String content,
    DateTime? sendTime,
    DateTime? modifiedTime,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfChatMessageDto.copyWith(...)` or call `instanceOfChatMessageDto.copyWith.fieldName(value)` for a single field.
class _$ChatMessageDtoCWProxyImpl implements _$ChatMessageDtoCWProxy {
  const _$ChatMessageDtoCWProxyImpl(this._value);

  final ChatMessageDto _value;

  @override
  ChatMessageDto id(String id) => call(id: id);

  @override
  ChatMessageDto guildChannelId(String guildChannelId) =>
      call(guildChannelId: guildChannelId);

  @override
  ChatMessageDto senderId(String senderId) => call(senderId: senderId);

  @override
  ChatMessageDto senderUserName(String? senderUserName) =>
      call(senderUserName: senderUserName);

  @override
  ChatMessageDto content(String content) => call(content: content);

  @override
  ChatMessageDto sendTime(DateTime? sendTime) => call(sendTime: sendTime);

  @override
  ChatMessageDto modifiedTime(DateTime? modifiedTime) =>
      call(modifiedTime: modifiedTime);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ChatMessageDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ChatMessageDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ChatMessageDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? guildChannelId = const $CopyWithPlaceholder(),
    Object? senderId = const $CopyWithPlaceholder(),
    Object? senderUserName = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? sendTime = const $CopyWithPlaceholder(),
    Object? modifiedTime = const $CopyWithPlaceholder(),
  }) {
    return ChatMessageDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      guildChannelId:
          guildChannelId == const $CopyWithPlaceholder() ||
              guildChannelId == null
          ? _value.guildChannelId
          // ignore: cast_nullable_to_non_nullable
          : guildChannelId as String,
      senderId: senderId == const $CopyWithPlaceholder() || senderId == null
          ? _value.senderId
          // ignore: cast_nullable_to_non_nullable
          : senderId as String,
      senderUserName: senderUserName == const $CopyWithPlaceholder()
          ? _value.senderUserName
          // ignore: cast_nullable_to_non_nullable
          : senderUserName as String?,
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
      sendTime: sendTime == const $CopyWithPlaceholder()
          ? _value.sendTime
          // ignore: cast_nullable_to_non_nullable
          : sendTime as DateTime?,
      modifiedTime: modifiedTime == const $CopyWithPlaceholder()
          ? _value.modifiedTime
          // ignore: cast_nullable_to_non_nullable
          : modifiedTime as DateTime?,
    );
  }
}

extension $ChatMessageDtoCopyWith on ChatMessageDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfChatMessageDto.copyWith(...)` or `instanceOfChatMessageDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageDtoCWProxy get copyWith => _$ChatMessageDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ChatMessageDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['id', 'guildChannelId', 'senderId', 'content'],
      );
      final val = ChatMessageDto(
        id: $checkedConvert('id', (v) => v as String),
        guildChannelId: $checkedConvert('guildChannelId', (v) => v as String),
        senderId: $checkedConvert('senderId', (v) => v as String),
        senderUserName: $checkedConvert('senderUserName', (v) => v as String?),
        content: $checkedConvert('content', (v) => v as String),
        sendTime: $checkedConvert(
          'sendTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        modifiedTime: $checkedConvert(
          'modifiedTime',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ChatMessageDtoToJson(ChatMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guildChannelId': instance.guildChannelId,
      'senderId': instance.senderId,
      'senderUserName': ?instance.senderUserName,
      'content': instance.content,
      'sendTime': ?instance.sendTime?.toIso8601String(),
      'modifiedTime': ?instance.modifiedTime?.toIso8601String(),
    };
