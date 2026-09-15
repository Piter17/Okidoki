// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_guild_channel_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateGuildChannelRequestCWProxy {
  CreateGuildChannelRequest groupId(String? groupId);

  CreateGuildChannelRequest name(String name);

  CreateGuildChannelRequest type(ChannelType type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateGuildChannelRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateGuildChannelRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateGuildChannelRequest call({
    String? groupId,
    String name,
    ChannelType type,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateGuildChannelRequest.copyWith(...)` or call `instanceOfCreateGuildChannelRequest.copyWith.fieldName(value)` for a single field.
class _$CreateGuildChannelRequestCWProxyImpl
    implements _$CreateGuildChannelRequestCWProxy {
  const _$CreateGuildChannelRequestCWProxyImpl(this._value);

  final CreateGuildChannelRequest _value;

  @override
  CreateGuildChannelRequest groupId(String? groupId) => call(groupId: groupId);

  @override
  CreateGuildChannelRequest name(String name) => call(name: name);

  @override
  CreateGuildChannelRequest type(ChannelType type) => call(type: type);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateGuildChannelRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateGuildChannelRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateGuildChannelRequest call({
    Object? groupId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return CreateGuildChannelRequest(
      groupId: groupId == const $CopyWithPlaceholder()
          ? _value.groupId
          // ignore: cast_nullable_to_non_nullable
          : groupId as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ChannelType,
    );
  }
}

extension $CreateGuildChannelRequestCopyWith on CreateGuildChannelRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateGuildChannelRequest.copyWith(...)` or `instanceOfCreateGuildChannelRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateGuildChannelRequestCWProxy get copyWith =>
      _$CreateGuildChannelRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGuildChannelRequest _$CreateGuildChannelRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateGuildChannelRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name', 'type']);
  final val = CreateGuildChannelRequest(
    groupId: $checkedConvert('groupId', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String),
    type: $checkedConvert('type', (v) => $enumDecode(_$ChannelTypeEnumMap, v)),
  );
  return val;
});

Map<String, dynamic> _$CreateGuildChannelRequestToJson(
  CreateGuildChannelRequest instance,
) => <String, dynamic>{
  'groupId': ?instance.groupId,
  'name': instance.name,
  'type': _$ChannelTypeEnumMap[instance.type]!,
};

const _$ChannelTypeEnumMap = {
  ChannelType.text: 'Text',
  ChannelType.voice: 'Voice',
};
