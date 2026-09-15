// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginRequestCWProxy {
  LoginRequest email(String email);

  LoginRequest password(String password);

  LoginRequest twoFactorCode(String? twoFactorCode);

  LoginRequest twoFactorRecoveryCode(String? twoFactorRecoveryCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  LoginRequest call({
    String email,
    String password,
    String? twoFactorCode,
    String? twoFactorRecoveryCode,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLoginRequest.copyWith(...)` or call `instanceOfLoginRequest.copyWith.fieldName(value)` for a single field.
class _$LoginRequestCWProxyImpl implements _$LoginRequestCWProxy {
  const _$LoginRequestCWProxyImpl(this._value);

  final LoginRequest _value;

  @override
  LoginRequest email(String email) => call(email: email);

  @override
  LoginRequest password(String password) => call(password: password);

  @override
  LoginRequest twoFactorCode(String? twoFactorCode) =>
      call(twoFactorCode: twoFactorCode);

  @override
  LoginRequest twoFactorRecoveryCode(String? twoFactorRecoveryCode) =>
      call(twoFactorRecoveryCode: twoFactorRecoveryCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LoginRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LoginRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  LoginRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? twoFactorCode = const $CopyWithPlaceholder(),
    Object? twoFactorRecoveryCode = const $CopyWithPlaceholder(),
  }) {
    return LoginRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      twoFactorCode: twoFactorCode == const $CopyWithPlaceholder()
          ? _value.twoFactorCode
          // ignore: cast_nullable_to_non_nullable
          : twoFactorCode as String?,
      twoFactorRecoveryCode:
          twoFactorRecoveryCode == const $CopyWithPlaceholder()
          ? _value.twoFactorRecoveryCode
          // ignore: cast_nullable_to_non_nullable
          : twoFactorRecoveryCode as String?,
    );
  }
}

extension $LoginRequestCopyWith on LoginRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLoginRequest.copyWith(...)` or `instanceOfLoginRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginRequestCWProxy get copyWith => _$LoginRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LoginRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email', 'password']);
      final val = LoginRequest(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        twoFactorCode: $checkedConvert('twoFactorCode', (v) => v as String?),
        twoFactorRecoveryCode: $checkedConvert(
          'twoFactorRecoveryCode',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'twoFactorCode': ?instance.twoFactorCode,
      'twoFactorRecoveryCode': ?instance.twoFactorRecoveryCode,
    };
