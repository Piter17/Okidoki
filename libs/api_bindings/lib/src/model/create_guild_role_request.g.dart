// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_guild_role_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateGuildRoleRequestCWProxy {
  CreateGuildRoleRequest name(String? name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateGuildRoleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateGuildRoleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateGuildRoleRequest call({String? name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateGuildRoleRequest.copyWith(...)` or call `instanceOfCreateGuildRoleRequest.copyWith.fieldName(value)` for a single field.
class _$CreateGuildRoleRequestCWProxyImpl
    implements _$CreateGuildRoleRequestCWProxy {
  const _$CreateGuildRoleRequestCWProxyImpl(this._value);

  final CreateGuildRoleRequest _value;

  @override
  CreateGuildRoleRequest name(String? name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateGuildRoleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateGuildRoleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateGuildRoleRequest call({Object? name = const $CopyWithPlaceholder()}) {
    return CreateGuildRoleRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $CreateGuildRoleRequestCopyWith on CreateGuildRoleRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateGuildRoleRequest.copyWith(...)` or `instanceOfCreateGuildRoleRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateGuildRoleRequestCWProxy get copyWith =>
      _$CreateGuildRoleRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGuildRoleRequest _$CreateGuildRoleRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateGuildRoleRequest', json, ($checkedConvert) {
  final val = CreateGuildRoleRequest(
    name: $checkedConvert('name', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$CreateGuildRoleRequestToJson(
  CreateGuildRoleRequest instance,
) => <String, dynamic>{'name': ?instance.name};
