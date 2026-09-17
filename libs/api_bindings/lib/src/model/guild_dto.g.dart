// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildDtoCWProxy {
  GuildDto ownerId(String? ownerId);

  GuildDto roles(List<GuildRoleDto>? roles);

  GuildDto channels(List<GuildChannelDto>? channels);

  GuildDto ownerUserName(String? ownerUserName);

  GuildDto memberCount(int? memberCount);

  GuildDto id(String id);

  GuildDto name(String name);

  GuildDto image(String? image);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildDto call({
    String? ownerId,
    List<GuildRoleDto>? roles,
    List<GuildChannelDto>? channels,
    String? ownerUserName,
    int? memberCount,
    String id,
    String name,
    String? image,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGuildDto.copyWith(...)` or call `instanceOfGuildDto.copyWith.fieldName(value)` for a single field.
class _$GuildDtoCWProxyImpl implements _$GuildDtoCWProxy {
  const _$GuildDtoCWProxyImpl(this._value);

  final GuildDto _value;

  @override
  GuildDto ownerId(String? ownerId) => call(ownerId: ownerId);

  @override
  GuildDto roles(List<GuildRoleDto>? roles) => call(roles: roles);

  @override
  GuildDto channels(List<GuildChannelDto>? channels) =>
      call(channels: channels);

  @override
  GuildDto ownerUserName(String? ownerUserName) =>
      call(ownerUserName: ownerUserName);

  @override
  GuildDto memberCount(int? memberCount) => call(memberCount: memberCount);

  @override
  GuildDto id(String id) => call(id: id);

  @override
  GuildDto name(String name) => call(name: name);

  @override
  GuildDto image(String? image) => call(image: image);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  GuildDto call({
    Object? ownerId = const $CopyWithPlaceholder(),
    Object? roles = const $CopyWithPlaceholder(),
    Object? channels = const $CopyWithPlaceholder(),
    Object? ownerUserName = const $CopyWithPlaceholder(),
    Object? memberCount = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
  }) {
    return GuildDto(
      ownerId: ownerId == const $CopyWithPlaceholder()
          ? _value.ownerId
          // ignore: cast_nullable_to_non_nullable
          : ownerId as String?,
      roles: roles == const $CopyWithPlaceholder()
          ? _value.roles
          // ignore: cast_nullable_to_non_nullable
          : roles as List<GuildRoleDto>?,
      channels: channels == const $CopyWithPlaceholder()
          ? _value.channels
          // ignore: cast_nullable_to_non_nullable
          : channels as List<GuildChannelDto>?,
      ownerUserName: ownerUserName == const $CopyWithPlaceholder()
          ? _value.ownerUserName
          // ignore: cast_nullable_to_non_nullable
          : ownerUserName as String?,
      memberCount: memberCount == const $CopyWithPlaceholder()
          ? _value.memberCount
          // ignore: cast_nullable_to_non_nullable
          : memberCount as int?,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
    );
  }
}

extension $GuildDtoCopyWith on GuildDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGuildDto.copyWith(...)` or `instanceOfGuildDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuildDtoCWProxy get copyWith => _$GuildDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildDto _$GuildDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'GuildDto',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['id', 'name']);
    final val = GuildDto(
      ownerId: $checkedConvert('ownerId', (v) => v as String?),
      roles: $checkedConvert(
        'roles',
        (v) => (v as List<dynamic>?)
            ?.map((e) => GuildRoleDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      channels: $checkedConvert(
        'channels',
        (v) => (v as List<dynamic>?)
            ?.map((e) => GuildChannelDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      ownerUserName: $checkedConvert('ownerUserName', (v) => v as String?),
      memberCount: $checkedConvert('memberCount', (v) => (v as num?)?.toInt()),
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      image: $checkedConvert('image', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$GuildDtoToJson(GuildDto instance) => <String, dynamic>{
  'ownerId': ?instance.ownerId,
  'roles': ?instance.roles?.map((e) => e.toJson()).toList(),
  'channels': ?instance.channels?.map((e) => e.toJson()).toList(),
  'ownerUserName': ?instance.ownerUserName,
  'memberCount': ?instance.memberCount,
  'id': instance.id,
  'name': instance.name,
  'image': ?instance.image,
};
