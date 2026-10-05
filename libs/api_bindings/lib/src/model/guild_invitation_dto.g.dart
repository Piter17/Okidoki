// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_invitation_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildInvitationDtoCWProxy {
  GuildInvitationDto id(String id);

  GuildInvitationDto guild(GuildProfileDto guild);

  GuildInvitationDto code(String? code);

  GuildInvitationDto createdBy(UserProfileDto? createdBy);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildInvitationDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildInvitationDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildInvitationDto call({
    String id,
    GuildProfileDto guild,
    String? code,
    UserProfileDto? createdBy,
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
  GuildInvitationDto guild(GuildProfileDto guild) => call(guild: guild);

  @override
  GuildInvitationDto code(String? code) => call(code: code);

  @override
  GuildInvitationDto createdBy(UserProfileDto? createdBy) =>
      call(createdBy: createdBy);

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
    Object? guild = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
  }) {
    return GuildInvitationDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      guild: guild == const $CopyWithPlaceholder() || guild == null
          ? _value.guild
          // ignore: cast_nullable_to_non_nullable
          : guild as GuildProfileDto,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as UserProfileDto?,
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
      $checkKeys(json, requiredKeys: const ['id', 'guild']);
      final val = GuildInvitationDto(
        id: $checkedConvert('id', (v) => v as String),
        guild: $checkedConvert(
          'guild',
          (v) => GuildProfileDto.fromJson(v as Map<String, dynamic>),
        ),
        code: $checkedConvert('code', (v) => v as String?),
        createdBy: $checkedConvert(
          'createdBy',
          (v) => v == null
              ? null
              : UserProfileDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$GuildInvitationDtoToJson(GuildInvitationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guild': instance.guild.toJson(),
      'code': ?instance.code,
      'createdBy': ?instance.createdBy?.toJson(),
    };
