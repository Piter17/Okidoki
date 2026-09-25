// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_registration_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FullRegistrationRequestCWProxy {
  FullRegistrationRequest profileName(String profileName);

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
    String profileName,
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
  FullRegistrationRequest profileName(String profileName) =>
      call(profileName: profileName);

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
    Object? profileName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return FullRegistrationRequest(
      profileName:
          profileName == const $CopyWithPlaceholder() || profileName == null
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String,
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
  $checkKeys(json, requiredKeys: const ['profileName', 'email', 'password']);
  final val = FullRegistrationRequest(
    profileName: $checkedConvert('profileName', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    password: $checkedConvert('password', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$FullRegistrationRequestToJson(
  FullRegistrationRequest instance,
) => <String, dynamic>{
  'profileName': instance.profileName,
  'email': instance.email,
  'password': instance.password,
};
