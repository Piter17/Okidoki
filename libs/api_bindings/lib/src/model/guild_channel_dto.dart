//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/channel_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_channel_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GuildChannelDto {
  /// Returns a new [GuildChannelDto] instance.
  GuildChannelDto({
    required this.id,

    required this.guildId,

    this.channelGroupId,

    required this.name,

    this.type,

    this.orderNumber,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'guildId', required: true, includeIfNull: false)
  final String guildId;

  @JsonKey(name: r'channelGroupId', required: false, includeIfNull: false)
  final String? channelGroupId;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'type', required: false, includeIfNull: false)
  final ChannelType? type;

  @JsonKey(name: r'orderNumber', required: false, includeIfNull: false)
  final int? orderNumber;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildChannelDto &&
          other.id == id &&
          other.guildId == guildId &&
          other.channelGroupId == channelGroupId &&
          other.name == name &&
          other.type == type &&
          other.orderNumber == orderNumber;

  @override
  int get hashCode =>
      id.hashCode +
      guildId.hashCode +
      (channelGroupId == null ? 0 : channelGroupId.hashCode) +
      name.hashCode +
      type.hashCode +
      orderNumber.hashCode;

  factory GuildChannelDto.fromJson(Map<String, dynamic> json) =>
      _$GuildChannelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildChannelDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
