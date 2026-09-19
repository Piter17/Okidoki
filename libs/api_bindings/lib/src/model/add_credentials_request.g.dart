// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_credentials_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddCredentialsRequestCWProxy {
  AddCredentialsRequest email(String email);

  AddCredentialsRequest password(String password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AddCredentialsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AddCredentialsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AddCredentialsRequest call({String email, String password});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAddCredentialsRequest.copyWith(...)` or call `instanceOfAddCredentialsRequest.copyWith.fieldName(value)` for a single field.
class _$AddCredentialsRequestCWProxyImpl
    implements _$AddCredentialsRequestCWProxy {
  const _$AddCredentialsRequestCWProxyImpl(this._value);

  final AddCredentialsRequest _value;

  @override
  AddCredentialsRequest email(String email) => call(email: email);

  @override
  AddCredentialsRequest password(String password) => call(password: password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AddCredentialsRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AddCredentialsRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AddCredentialsRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return AddCredentialsRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $AddCredentialsRequestCopyWith on AddCredentialsRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAddCredentialsRequest.copyWith(...)` or `instanceOfAddCredentialsRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddCredentialsRequestCWProxy get copyWith =>
      _$AddCredentialsRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCredentialsRequest _$AddCredentialsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AddCredentialsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['email', 'password']);
  final val = AddCredentialsRequest(
    email: $checkedConvert('email', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$AddCredentialsRequestToJson(
  AddCredentialsRequest instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
