// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResetPasswordRequestCWProxy {
  ResetPasswordRequest email(String email);

  ResetPasswordRequest resetCode(String resetCode);

  ResetPasswordRequest newPassword(String newPassword);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ResetPasswordRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ResetPasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ResetPasswordRequest call({
    String email,
    String resetCode,
    String newPassword,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfResetPasswordRequest.copyWith(...)` or call `instanceOfResetPasswordRequest.copyWith.fieldName(value)` for a single field.
class _$ResetPasswordRequestCWProxyImpl
    implements _$ResetPasswordRequestCWProxy {
  const _$ResetPasswordRequestCWProxyImpl(this._value);

  final ResetPasswordRequest _value;

  @override
  ResetPasswordRequest email(String email) => call(email: email);

  @override
  ResetPasswordRequest resetCode(String resetCode) =>
      call(resetCode: resetCode);

  @override
  ResetPasswordRequest newPassword(String newPassword) =>
      call(newPassword: newPassword);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ResetPasswordRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ResetPasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ResetPasswordRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? resetCode = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
  }) {
    return ResetPasswordRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      resetCode: resetCode == const $CopyWithPlaceholder() || resetCode == null
          ? _value.resetCode
          // ignore: cast_nullable_to_non_nullable
          : resetCode as String,
      newPassword:
          newPassword == const $CopyWithPlaceholder() || newPassword == null
          ? _value.newPassword
          // ignore: cast_nullable_to_non_nullable
          : newPassword as String,
    );
  }
}

extension $ResetPasswordRequestCopyWith on ResetPasswordRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfResetPasswordRequest.copyWith(...)` or `instanceOfResetPasswordRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResetPasswordRequestCWProxy get copyWith =>
      _$ResetPasswordRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResetPasswordRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['email', 'resetCode', 'newPassword']);
  final val = ResetPasswordRequest(
    email: $checkedConvert('email', (v) => v as String),
    resetCode: $checkedConvert('resetCode', (v) => v as String),
    newPassword: $checkedConvert('newPassword', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ResetPasswordRequestToJson(
  ResetPasswordRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'resetCode': instance.resetCode,
  'newPassword': instance.newPassword,
};
