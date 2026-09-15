// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_user_name.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterRequestUserNameCWProxy {
  RegisterRequestUserName email(String email);

  RegisterRequestUserName password(String password);

  RegisterRequestUserName userName(String userName);

  RegisterRequestUserName profileName(String? profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterRequestUserName(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterRequestUserName(...).copyWith(id: 12, name: "My name")
  /// ```
  RegisterRequestUserName call({
    String email,
    String password,
    String userName,
    String? profileName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRegisterRequestUserName.copyWith(...)` or call `instanceOfRegisterRequestUserName.copyWith.fieldName(value)` for a single field.
class _$RegisterRequestUserNameCWProxyImpl
    implements _$RegisterRequestUserNameCWProxy {
  const _$RegisterRequestUserNameCWProxyImpl(this._value);

  final RegisterRequestUserName _value;

  @override
  RegisterRequestUserName email(String email) => call(email: email);

  @override
  RegisterRequestUserName password(String password) => call(password: password);

  @override
  RegisterRequestUserName userName(String userName) => call(userName: userName);

  @override
  RegisterRequestUserName profileName(String? profileName) =>
      call(profileName: profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterRequestUserName(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterRequestUserName(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RegisterRequestUserName call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? profileName = const $CopyWithPlaceholder(),
  }) {
    return RegisterRequestUserName(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
      profileName: profileName == const $CopyWithPlaceholder()
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String?,
    );
  }
}

extension $RegisterRequestUserNameCopyWith on RegisterRequestUserName {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRegisterRequestUserName.copyWith(...)` or `instanceOfRegisterRequestUserName.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterRequestUserNameCWProxy get copyWith =>
      _$RegisterRequestUserNameCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestUserName _$RegisterRequestUserNameFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RegisterRequestUserName', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['email', 'password', 'userName']);
  final val = RegisterRequestUserName(
    email: $checkedConvert('email', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
    userName: $checkedConvert('userName', (v) => v as String),
    profileName: $checkedConvert('profileName', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$RegisterRequestUserNameToJson(
  RegisterRequestUserName instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'userName': instance.userName,
  'profileName': ?instance.profileName,
};
