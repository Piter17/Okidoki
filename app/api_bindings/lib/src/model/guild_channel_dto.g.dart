// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_channel_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildChannelDtoCWProxy {
  GuildChannelDto id(String id);

  GuildChannelDto guildId(String guildId);

  GuildChannelDto channelGroupId(String? channelGroupId);

  GuildChannelDto name(String name);

  GuildChannelDto type(ChannelType? type);

  GuildChannelDto orderNumber(int? orderNumber);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildChannelDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildChannelDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildChannelDto call({
    String id,
    String guildId,
    String? channelGroupId,
    String name,
    ChannelType? type,
    int? orderNumber,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGuildChannelDto.copyWith(...)` or call `instanceOfGuildChannelDto.copyWith.fieldName(value)` for a single field.
class _$GuildChannelDtoCWProxyImpl implements _$GuildChannelDtoCWProxy {
  const _$GuildChannelDtoCWProxyImpl(this._value);

  final GuildChannelDto _value;

  @override
  GuildChannelDto id(String id) => call(id: id);

  @override
  GuildChannelDto guildId(String guildId) => call(guildId: guildId);

  @override
  GuildChannelDto channelGroupId(String? channelGroupId) =>
      call(channelGroupId: channelGroupId);

  @override
  GuildChannelDto name(String name) => call(name: name);

  @override
  GuildChannelDto type(ChannelType? type) => call(type: type);

  @override
  GuildChannelDto orderNumber(int? orderNumber) =>
      call(orderNumber: orderNumber);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildChannelDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildChannelDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  GuildChannelDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? guildId = const $CopyWithPlaceholder(),
    Object? channelGroupId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? orderNumber = const $CopyWithPlaceholder(),
  }) {
    return GuildChannelDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      guildId: guildId == const $CopyWithPlaceholder() || guildId == null
          ? _value.guildId
          // ignore: cast_nullable_to_non_nullable
          : guildId as String,
      channelGroupId: channelGroupId == const $CopyWithPlaceholder()
          ? _value.channelGroupId
          // ignore: cast_nullable_to_non_nullable
          : channelGroupId as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ChannelType?,
      orderNumber: orderNumber == const $CopyWithPlaceholder()
          ? _value.orderNumber
          // ignore: cast_nullable_to_non_nullable
          : orderNumber as int?,
    );
  }
}

extension $GuildChannelDtoCopyWith on GuildChannelDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGuildChannelDto.copyWith(...)` or `instanceOfGuildChannelDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuildChannelDtoCWProxy get copyWith => _$GuildChannelDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildChannelDto _$GuildChannelDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GuildChannelDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'guildId', 'name']);
      final val = GuildChannelDto(
        id: $checkedConvert('id', (v) => v as String),
        guildId: $checkedConvert('guildId', (v) => v as String),
        channelGroupId: $checkedConvert('channelGroupId', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String),
        type: $checkedConvert(
          'type',
          (v) => $enumDecodeNullable(_$ChannelTypeEnumMap, v),
        ),
        orderNumber: $checkedConvert(
          'orderNumber',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GuildChannelDtoToJson(GuildChannelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guildId': instance.guildId,
      'channelGroupId': ?instance.channelGroupId,
      'name': instance.name,
      'type': ?_$ChannelTypeEnumMap[instance.type],
      'orderNumber': ?instance.orderNumber,
    };

const _$ChannelTypeEnumMap = {
  ChannelType.text: 'Text',
  ChannelType.voice: 'Voice',
};
