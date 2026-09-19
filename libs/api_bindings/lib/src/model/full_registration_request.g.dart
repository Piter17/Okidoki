// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_registration_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FullRegistrationRequestCWProxy {
  FullRegistrationRequest userName(String userName);

  FullRegistrationRequest email(String email);

  FullRegistrationRequest password(String password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FullRegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FullRegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  FullRegistrationRequest call({
    String userName,
    String email,
    String password,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFullRegistrationRequest.copyWith(...)` or call `instanceOfFullRegistrationRequest.copyWith.fieldName(value)` for a single field.
class _$FullRegistrationRequestCWProxyImpl
    implements _$FullRegistrationRequestCWProxy {
  const _$FullRegistrationRequestCWProxyImpl(this._value);

  final FullRegistrationRequest _value;

  @override
  FullRegistrationRequest userName(String userName) => call(userName: userName);

  @override
  FullRegistrationRequest email(String email) => call(email: email);

  @override
  FullRegistrationRequest password(String password) => call(password: password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FullRegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FullRegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FullRegistrationRequest call({
    Object? userName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return FullRegistrationRequest(
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
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

extension $FullRegistrationRequestCopyWith on FullRegistrationRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFullRegistrationRequest.copyWith(...)` or `instanceOfFullRegistrationRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FullRegistrationRequestCWProxy get copyWith =>
      _$FullRegistrationRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullRegistrationRequest _$FullRegistrationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FullRegistrationRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['userName', 'email', 'password']);
  final val = FullRegistrationRequest(
    userName: $checkedConvert('userName', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$FullRegistrationRequestToJson(
  FullRegistrationRequest instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'email': instance.email,
  'password': instance.password,
};
