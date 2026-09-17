// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserRegisterRequestCWProxy {
  UserRegisterRequest email(String email);

  UserRegisterRequest userName(String? userName);

  UserRegisterRequest password(String password);

  UserRegisterRequest profileName(String profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UserRegisterRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UserRegisterRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UserRegisterRequest call({
    String email,
    String? userName,
    String password,
    String profileName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUserRegisterRequest.copyWith(...)` or call `instanceOfUserRegisterRequest.copyWith.fieldName(value)` for a single field.
class _$UserRegisterRequestCWProxyImpl implements _$UserRegisterRequestCWProxy {
  const _$UserRegisterRequestCWProxyImpl(this._value);

  final UserRegisterRequest _value;

  @override
  UserRegisterRequest email(String email) => call(email: email);

  @override
  UserRegisterRequest userName(String? userName) => call(userName: userName);

  @override
  UserRegisterRequest password(String password) => call(password: password);

  @override
  UserRegisterRequest profileName(String profileName) =>
      call(profileName: profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UserRegisterRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UserRegisterRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UserRegisterRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? profileName = const $CopyWithPlaceholder(),
  }) {
    return UserRegisterRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      profileName:
          profileName == const $CopyWithPlaceholder() || profileName == null
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String,
    );
  }
}

extension $UserRegisterRequestCopyWith on UserRegisterRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUserRegisterRequest.copyWith(...)` or `instanceOfUserRegisterRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserRegisterRequestCWProxy get copyWith =>
      _$UserRegisterRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserRegisterRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['email', 'password', 'profileName'],
      );
      final val = UserRegisterRequest(
        email: $checkedConvert('email', (v) => v as String),
        userName: $checkedConvert('userName', (v) => v as String?),
        password: $checkedConvert('password', (v) => v as String),
        profileName: $checkedConvert('profileName', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$UserRegisterRequestToJson(
  UserRegisterRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'userName': ?instance.userName,
  'password': instance.password,
  'profileName': instance.profileName,
};
