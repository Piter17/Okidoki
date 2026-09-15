// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_role_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildRoleDtoCWProxy {
  GuildRoleDto id(String id);

  GuildRoleDto guildId(String guildId);

  GuildRoleDto name(String name);

  GuildRoleDto permissions(int? permissions);

  GuildRoleDto color(int? color);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildRoleDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildRoleDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildRoleDto call({
    String id,
    String guildId,
    String name,
    int? permissions,
    int? color,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGuildRoleDto.copyWith(...)` or call `instanceOfGuildRoleDto.copyWith.fieldName(value)` for a single field.
class _$GuildRoleDtoCWProxyImpl implements _$GuildRoleDtoCWProxy {
  const _$GuildRoleDtoCWProxyImpl(this._value);

  final GuildRoleDto _value;

  @override
  GuildRoleDto id(String id) => call(id: id);

  @override
  GuildRoleDto guildId(String guildId) => call(guildId: guildId);

  @override
  GuildRoleDto name(String name) => call(name: name);

  @override
  GuildRoleDto permissions(int? permissions) => call(permissions: permissions);

  @override
  GuildRoleDto color(int? color) => call(color: color);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildRoleDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildRoleDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  GuildRoleDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? guildId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? permissions = const $CopyWithPlaceholder(),
    Object? color = const $CopyWithPlaceholder(),
  }) {
    return GuildRoleDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      guildId: guildId == const $CopyWithPlaceholder() || guildId == null
          ? _value.guildId
          // ignore: cast_nullable_to_non_nullable
          : guildId as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      permissions: permissions == const $CopyWithPlaceholder()
          ? _value.permissions
          // ignore: cast_nullable_to_non_nullable
          : permissions as int?,
      color: color == const $CopyWithPlaceholder()
          ? _value.color
          // ignore: cast_nullable_to_non_nullable
          : color as int?,
    );
  }
}

extension $GuildRoleDtoCopyWith on GuildRoleDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGuildRoleDto.copyWith(...)` or `instanceOfGuildRoleDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuildRoleDtoCWProxy get copyWith => _$GuildRoleDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildRoleDto _$GuildRoleDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GuildRoleDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'guildId', 'name']);
      final val = GuildRoleDto(
        id: $checkedConvert('id', (v) => v as String),
        guildId: $checkedConvert('guildId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        permissions: $checkedConvert(
          'permissions',
          (v) => (v as num?)?.toInt(),
        ),
        color: $checkedConvert('color', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$GuildRoleDtoToJson(GuildRoleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guildId': instance.guildId,
      'name': instance.name,
      'permissions': ?instance.permissions,
      'color': ?instance.color,
    };
