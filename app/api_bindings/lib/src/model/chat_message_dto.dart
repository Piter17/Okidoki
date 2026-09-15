//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatMessageDto {
  /// Returns a new [ChatMessageDto] instance.
  ChatMessageDto({
    required this.id,

    required this.guildChannelId,

    required this.senderId,

    this.senderUserName,

    required this.content,

    this.sendTime,

    this.modifiedTime,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'guildChannelId', required: true, includeIfNull: false)
  final String guildChannelId;

  @JsonKey(name: r'senderId', required: true, includeIfNull: false)
  final String senderId;

  @JsonKey(name: r'senderUserName', required: false, includeIfNull: false)
  final String? senderUserName;

  @JsonKey(name: r'content', required: true, includeIfNull: false)
  final String content;

  @JsonKey(name: r'sendTime', required: false, includeIfNull: false)
  final DateTime? sendTime;

  @JsonKey(name: r'modifiedTime', required: false, includeIfNull: false)
  final DateTime? modifiedTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageDto &&
          other.id == id &&
          other.guildChannelId == guildChannelId &&
          other.senderId == senderId &&
          other.senderUserName == senderUserName &&
          other.content == content &&
          other.sendTime == sendTime &&
          other.modifiedTime == modifiedTime;

  @override
  int get hashCode =>
      id.hashCode +
      guildChannelId.hashCode +
      senderId.hashCode +
      senderUserName.hashCode +
      content.hashCode +
      sendTime.hashCode +
      (modifiedTime == null ? 0 : modifiedTime.hashCode);

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
