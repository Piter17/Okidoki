//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guild_profile_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GuildProfileDto {
  /// Returns a new [GuildProfileDto] instance.
  GuildProfileDto({
    required this.id,

    required this.name,

    this.mainChannelId,

    this.image,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'mainChannelId', required: false, includeIfNull: false)
  final String? mainChannelId;

  @JsonKey(name: r'image', required: false, includeIfNull: false)
  final String? image;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildProfileDto &&
          other.id == id &&
          other.name == name &&
          other.mainChannelId == mainChannelId &&
          other.image == image;

  @override
  int get hashCode =>
      id.hashCode +
      name.hashCode +
      (mainChannelId == null ? 0 : mainChannelId.hashCode) +
      (image == null ? 0 : image.hashCode);

  factory GuildProfileDto.fromJson(Map<String, dynamic> json) =>
      _$GuildProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuildProfileDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
