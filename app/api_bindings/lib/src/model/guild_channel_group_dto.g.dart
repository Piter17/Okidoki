// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_channel_group_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildChannelGroupDtoCWProxy {
  GuildChannelGroupDto id(int? id);

  GuildChannelGroupDto guildId(int? guildId);

  GuildChannelGroupDto channels(List<GuildChannelDto>? channels);

  GuildChannelGroupDto orderNumber(int? orderNumber);

  GuildChannelGroupDto name(String? name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildChannelGroupDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildChannelGroupDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildChannelGroupDto call({
    int? id,
    int? guildId,
    List<GuildChannelDto>? channels,
    int? orderNumber,
    String? name,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGuildChannelGroupDto.copyWith(...)` or call `instanceOfGuildChannelGroupDto.copyWith.fieldName(value)` for a single field.
class _$GuildChannelGroupDtoCWProxyImpl
    implements _$GuildChannelGroupDtoCWProxy {
  const _$GuildChannelGroupDtoCWProxyImpl(this._value);

  final GuildChannelGroupDto _value;

  @override
  GuildChannelGroupDto id(int? id) => call(id: id);

  @override
  GuildChannelGroupDto guildId(int? guildId) => call(guildId: guildId);

  @override
  GuildChannelGroupDto channels(List<GuildChannelDto>? channels) =>
      call(channels: channels);

  @override
  GuildChannelGroupDto orderNumber(int? orderNumber) =>
      call(orderNumber: orderNumber);

  @override
  GuildChannelGroupDto name(String? name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildChannelGroupDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildChannelGroupDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  GuildChannelGroupDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? guildId = const $CopyWithPlaceholder(),
    Object? channels = const $CopyWithPlaceholder(),
    Object? orderNumber = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return GuildChannelGroupDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      guildId: guildId == const $CopyWithPlaceholder()
          ? _value.guildId
          // ignore: cast_nullable_to_non_nullable
          : guildId as int?,
      channels: channels == const $CopyWithPlaceholder()
          ? _value.channels
          // ignore: cast_nullable_to_non_nullable
          : channels as List<GuildChannelDto>?,
      orderNumber: orderNumber == const $CopyWithPlaceholder()
          ? _value.orderNumber
          // ignore: cast_nullable_to_non_nullable
          : orderNumber as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $GuildChannelGroupDtoCopyWith on GuildChannelGroupDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGuildChannelGroupDto.copyWith(...)` or `instanceOfGuildChannelGroupDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuildChannelGroupDtoCWProxy get copyWith =>
      _$GuildChannelGroupDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildChannelGroupDto _$GuildChannelGroupDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GuildChannelGroupDto', json, ($checkedConvert) {
  final val = GuildChannelGroupDto(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    guildId: $checkedConvert('guildId', (v) => (v as num?)?.toInt()),
    channels: $checkedConvert(
      'channels',
      (v) => (v as List<dynamic>?)
          ?.map((e) => GuildChannelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    orderNumber: $checkedConvert('orderNumber', (v) => (v as num?)?.toInt()),
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$GuildChannelGroupDtoToJson(
  GuildChannelGroupDto instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'guildId': ?instance.guildId,
  'channels': ?instance.channels?.map((e) => e.toJson()).toList(),
  'orderNumber': ?instance.orderNumber,
  'name': ?instance.name,
};
