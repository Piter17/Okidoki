//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/guild_channel_dto.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_channel_group_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GuildChannelGroupDto {
  /// Returns a new [GuildChannelGroupDto] instance.
  GuildChannelGroupDto({
    this.id,
    this.guildId,
    this.channels,
    this.orderNumber,
    this.name,
  });

  @JsonKey(
    name: r'id',
    required: false,
    includeIfNull: false,
  )
  final int? id;

  @JsonKey(
    name: r'guildId',
    required: false,
    includeIfNull: false,
  )
  final int? guildId;

  @JsonKey(
    name: r'channels',
    required: false,
    includeIfNull: false,
  )
  final List<GuildChannelDto>? channels;

  @JsonKey(
    name: r'orderNumber',
    required: false,
    includeIfNull: false,
  )
  final int? orderNumber;

  @JsonKey(
    name: r'name',
    required: false,
    includeIfNull: false,
  )
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildChannelGroupDto &&
          other.id == id &&
          other.guildId == guildId &&
          other.channels == channels &&
          other.orderNumber == orderNumber &&
          other.name == name;

  @override
  int get hashCode =>
      id.hashCode +
      guildId.hashCode +
      channels.hashCode +
      orderNumber.hashCode +
      name.hashCode;

  factory GuildChannelGroupDto.fromJson(Map<String, dynamic> json) =>
      _$GuildChannelGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildChannelGroupDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
