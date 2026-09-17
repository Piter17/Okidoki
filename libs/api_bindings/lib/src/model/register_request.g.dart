// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterRequestCWProxy {
  RegisterRequest email(String email);

  RegisterRequest password(String password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  RegisterRequest call({String email, String password});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRegisterRequest.copyWith(...)` or call `instanceOfRegisterRequest.copyWith.fieldName(value)` for a single field.
class _$RegisterRequestCWProxyImpl implements _$RegisterRequestCWProxy {
  const _$RegisterRequestCWProxyImpl(this._value);

  final RegisterRequest _value;

  @override
  RegisterRequest email(String email) => call(email: email);

  @override
  RegisterRequest password(String password) => call(password: password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RegisterRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return RegisterRequest(
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

extension $RegisterRequestCopyWith on RegisterRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRegisterRequest.copyWith(...)` or `instanceOfRegisterRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterRequestCWProxy get copyWith => _$RegisterRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email', 'password']);
      final val = RegisterRequest(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
