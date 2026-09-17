//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_chat_message_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateChatMessageRequest {
  /// Returns a new [CreateChatMessageRequest] instance.
  CreateChatMessageRequest({required this.content});

  @JsonKey(name: r'content', required: true, includeIfNull: false)
  final String content;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateChatMessageRequest && other.content == content;

  @override
  int get hashCode => content.hashCode;

  factory CreateChatMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChatMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChatMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
