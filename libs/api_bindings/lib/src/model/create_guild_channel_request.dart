//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/channel_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_guild_channel_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateGuildChannelRequest {
  /// Returns a new [CreateGuildChannelRequest] instance.
  CreateGuildChannelRequest({
    this.groupId,

    required this.name,

    required this.type,
  });

  @JsonKey(name: r'groupId', required: false, includeIfNull: false)
  final String? groupId;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'type', required: true, includeIfNull: false)
  final ChannelType type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateGuildChannelRequest &&
          other.groupId == groupId &&
          other.name == name &&
          other.type == type;

  @override
  int get hashCode =>
      (groupId == null ? 0 : groupId.hashCode) + name.hashCode + type.hashCode;

  factory CreateGuildChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGuildChannelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGuildChannelRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
