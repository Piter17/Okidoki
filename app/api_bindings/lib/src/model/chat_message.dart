//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatMessage {
  /// Returns a new [ChatMessage] instance.
  ChatMessage({
    this.id,
    this.guildChannelId,
    this.senderId,
    this.sendTime,
    this.modifiedTime,
    required this.content,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  final int? id;

  @JsonKey(
    name: r'guildChannelId',
    required: false,
    includeIfNull: false,
  )
  final int? guildChannelId;

  @JsonKey(
    name: r'senderId',
    required: false,
    includeIfNull: false,
  )
  final int? senderId;

  @JsonKey(
    name: r'sendTime',
    required: false,
    includeIfNull: false,
  )
  final DateTime? sendTime;

  @JsonKey(
    name: r'modifiedTime',
    required: false,
    includeIfNull: false,
  )
  final DateTime? modifiedTime;

  @JsonKey(
    name: r'content',
    required: true,
    includeIfNull: false,
  )
  final String content;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessage &&
          other.id == id &&
          other.guildChannelId == guildChannelId &&
          other.senderId == senderId &&
          other.sendTime == sendTime &&
          other.modifiedTime == modifiedTime &&
          other.content == content;

  @override
  int get hashCode =>
      id.hashCode +
      guildChannelId.hashCode +
      senderId.hashCode +
      sendTime.hashCode +
      (modifiedTime == null ? 0 : modifiedTime.hashCode) +
      content.hashCode;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
