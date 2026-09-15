// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_guild_name_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateGuildNameRequestCWProxy {
  UpdateGuildNameRequest name(String? name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateGuildNameRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateGuildNameRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateGuildNameRequest call({String? name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateGuildNameRequest.copyWith(...)` or call `instanceOfUpdateGuildNameRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateGuildNameRequestCWProxyImpl
    implements _$UpdateGuildNameRequestCWProxy {
  const _$UpdateGuildNameRequestCWProxyImpl(this._value);

  final UpdateGuildNameRequest _value;

  @override
  UpdateGuildNameRequest name(String? name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateGuildNameRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateGuildNameRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateGuildNameRequest call({Object? name = const $CopyWithPlaceholder()}) {
    return UpdateGuildNameRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $UpdateGuildNameRequestCopyWith on UpdateGuildNameRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateGuildNameRequest.copyWith(...)` or `instanceOfUpdateGuildNameRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateGuildNameRequestCWProxy get copyWith =>
      _$UpdateGuildNameRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGuildNameRequest _$UpdateGuildNameRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateGuildNameRequest', json, ($checkedConvert) {
  final val = UpdateGuildNameRequest(
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$UpdateGuildNameRequestToJson(
  UpdateGuildNameRequest instance,
) => <String, dynamic>{'name': ?instance.name};
