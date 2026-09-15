// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_ex.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterRequestExCWProxy {
  RegisterRequestEx email(String? email);

  RegisterRequestEx userName(String? userName);

  RegisterRequestEx password(String? password);

  RegisterRequestEx profileName(String? profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterRequestEx(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterRequestEx(...).copyWith(id: 12, name: "My name")
  /// ```
  RegisterRequestEx call({
    String? email,
    String? userName,
    String? password,
    String? profileName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRegisterRequestEx.copyWith(...)` or call `instanceOfRegisterRequestEx.copyWith.fieldName(value)` for a single field.
class _$RegisterRequestExCWProxyImpl implements _$RegisterRequestExCWProxy {
  const _$RegisterRequestExCWProxyImpl(this._value);

  final RegisterRequestEx _value;

  @override
  RegisterRequestEx email(String? email) => call(email: email);

  @override
  RegisterRequestEx userName(String? userName) => call(userName: userName);

  @override
  RegisterRequestEx password(String? password) => call(password: password);

  @override
  RegisterRequestEx profileName(String? profileName) =>
      call(profileName: profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterRequestEx(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterRequestEx(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RegisterRequestEx call({
    Object? email = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? profileName = const $CopyWithPlaceholder(),
  }) {
    return RegisterRequestEx(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      profileName: profileName == const $CopyWithPlaceholder()
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String?,
    );
  }
}

extension $RegisterRequestExCopyWith on RegisterRequestEx {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRegisterRequestEx.copyWith(...)` or `instanceOfRegisterRequestEx.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterRequestExCWProxy get copyWith =>
      _$RegisterRequestExCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestEx _$RegisterRequestExFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterRequestEx', json, ($checkedConvert) {
      final val = RegisterRequestEx(
        email: $checkedConvert('email', (v) => v as String?),
        userName: $checkedConvert('userName', (v) => v as String?),
        password: $checkedConvert('password', (v) => v as String?),
        profileName: $checkedConvert('profileName', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$RegisterRequestExToJson(RegisterRequestEx instance) =>
    <String, dynamic>{
      'email': ?instance.email,
      'userName': ?instance.userName,
      'password': ?instance.password,
      'profileName': ?instance.profileName,
    };
