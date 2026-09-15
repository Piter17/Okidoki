// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_invitation_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildInvitationDtoCWProxy {
  GuildInvitationDto id(String id);

  GuildInvitationDto guildId(String guildId);

  GuildInvitationDto code(String? code);

  GuildInvitationDto validUntil(DateTime? validUntil);

  GuildInvitationDto maxUses(int? maxUses);

  GuildInvitationDto createdById(String? createdById);

  GuildInvitationDto createdByUserName(String? createdByUserName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildInvitationDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildInvitationDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildInvitationDto call({
    String id,
    String guildId,
    String? code,
    DateTime? validUntil,
    int? maxUses,
    String? createdById,
    String? createdByUserName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGuildInvitationDto.copyWith(...)` or call `instanceOfGuildInvitationDto.copyWith.fieldName(value)` for a single field.
class _$GuildInvitationDtoCWProxyImpl implements _$GuildInvitationDtoCWProxy {
  const _$GuildInvitationDtoCWProxyImpl(this._value);

  final GuildInvitationDto _value;

  @override
  GuildInvitationDto id(String id) => call(id: id);

  @override
  GuildInvitationDto guildId(String guildId) => call(guildId: guildId);

  @override
  GuildInvitationDto code(String? code) => call(code: code);

  @override
  GuildInvitationDto validUntil(DateTime? validUntil) =>
      call(validUntil: validUntil);

  @override
  GuildInvitationDto maxUses(int? maxUses) => call(maxUses: maxUses);

  @override
  GuildInvitationDto createdById(String? createdById) =>
      call(createdById: createdById);

  @override
  GuildInvitationDto createdByUserName(String? createdByUserName) =>
      call(createdByUserName: createdByUserName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildInvitationDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildInvitationDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  GuildInvitationDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? guildId = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? validUntil = const $CopyWithPlaceholder(),
    Object? maxUses = const $CopyWithPlaceholder(),
    Object? createdById = const $CopyWithPlaceholder(),
    Object? createdByUserName = const $CopyWithPlaceholder(),
  }) {
    return GuildInvitationDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      guildId: guildId == const $CopyWithPlaceholder() || guildId == null
          ? _value.guildId
          // ignore: cast_nullable_to_non_nullable
          : guildId as String,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      validUntil: validUntil == const $CopyWithPlaceholder()
          ? _value.validUntil
          // ignore: cast_nullable_to_non_nullable
          : validUntil as DateTime?,
      maxUses: maxUses == const $CopyWithPlaceholder()
          ? _value.maxUses
          // ignore: cast_nullable_to_non_nullable
          : maxUses as int?,
      createdById: createdById == const $CopyWithPlaceholder()
          ? _value.createdById
          // ignore: cast_nullable_to_non_nullable
          : createdById as String?,
      createdByUserName: createdByUserName == const $CopyWithPlaceholder()
          ? _value.createdByUserName
          // ignore: cast_nullable_to_non_nullable
          : createdByUserName as String?,
    );
  }
}

extension $GuildInvitationDtoCopyWith on GuildInvitationDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGuildInvitationDto.copyWith(...)` or `instanceOfGuildInvitationDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuildInvitationDtoCWProxy get copyWith =>
      _$GuildInvitationDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildInvitationDto _$GuildInvitationDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GuildInvitationDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'guildId']);
      final val = GuildInvitationDto(
        id: $checkedConvert('id', (v) => v as String),
        guildId: $checkedConvert('guildId', (v) => v as String),
        code: $checkedConvert('code', (v) => v as String?),
        validUntil: $checkedConvert(
          'validUntil',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        maxUses: $checkedConvert('maxUses', (v) => (v as num?)?.toInt()),
        createdById: $checkedConvert('createdById', (v) => v as String?),
        createdByUserName: $checkedConvert(
          'createdByUserName',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$GuildInvitationDtoToJson(GuildInvitationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guildId': instance.guildId,
      'code': ?instance.code,
      'validUntil': ?instance.validUntil?.toIso8601String(),
      'maxUses': ?instance.maxUses,
      'createdById': ?instance.createdById,
      'createdByUserName': ?instance.createdByUserName,
    };
