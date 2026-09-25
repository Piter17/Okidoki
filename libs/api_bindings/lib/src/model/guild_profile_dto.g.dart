// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guild_profile_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GuildProfileDtoCWProxy {
  GuildProfileDto id(String id);

  GuildProfileDto name(String name);

  GuildProfileDto mainChannelId(String? mainChannelId);

  GuildProfileDto image(String? image);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildProfileDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildProfileDto(...).copyWith(id: 12, name: "My name")
  /// ```
  GuildProfileDto call({
    String id,
    String name,
    String? mainChannelId,
    String? image,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfGuildProfileDto.copyWith(...)` or call `instanceOfGuildProfileDto.copyWith.fieldName(value)` for a single field.
class _$GuildProfileDtoCWProxyImpl implements _$GuildProfileDtoCWProxy {
  const _$GuildProfileDtoCWProxyImpl(this._value);

  final GuildProfileDto _value;

  @override
  GuildProfileDto id(String id) => call(id: id);

  @override
  GuildProfileDto name(String name) => call(name: name);

  @override
  GuildProfileDto mainChannelId(String? mainChannelId) =>
      call(mainChannelId: mainChannelId);

  @override
  GuildProfileDto image(String? image) => call(image: image);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `GuildProfileDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// GuildProfileDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  GuildProfileDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? mainChannelId = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
  }) {
    return GuildProfileDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      mainChannelId: mainChannelId == const $CopyWithPlaceholder()
          ? _value.mainChannelId
          // ignore: cast_nullable_to_non_nullable
          : mainChannelId as String?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
    );
  }
}

extension $GuildProfileDtoCopyWith on GuildProfileDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfGuildProfileDto.copyWith(...)` or `instanceOfGuildProfileDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuildProfileDtoCWProxy get copyWith => _$GuildProfileDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuildProfileDto _$GuildProfileDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GuildProfileDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'name']);
      final val = GuildProfileDto(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        mainChannelId: $checkedConvert('mainChannelId', (v) => v as String?),
        image: $checkedConvert('image', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$GuildProfileDtoToJson(GuildProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mainChannelId': ?instance.mainChannelId,
      'image': ?instance.image,
    };
