// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegistrationRequestCWProxy {
  RegistrationRequest email(String email);

  RegistrationRequest password(String password);

  RegistrationRequest profileName(String profileName);

  RegistrationRequest guildInvitationCode(String? guildInvitationCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  RegistrationRequest call({
    String email,
    String password,
    String profileName,
    String? guildInvitationCode,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRegistrationRequest.copyWith(...)` or call `instanceOfRegistrationRequest.copyWith.fieldName(value)` for a single field.
class _$RegistrationRequestCWProxyImpl implements _$RegistrationRequestCWProxy {
  const _$RegistrationRequestCWProxyImpl(this._value);

  final RegistrationRequest _value;

  @override
  RegistrationRequest email(String email) => call(email: email);

  @override
  RegistrationRequest password(String password) => call(password: password);

  @override
  RegistrationRequest profileName(String profileName) =>
      call(profileName: profileName);

  @override
  RegistrationRequest guildInvitationCode(String? guildInvitationCode) =>
      call(guildInvitationCode: guildInvitationCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RegistrationRequest call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? profileName = const $CopyWithPlaceholder(),
    Object? guildInvitationCode = const $CopyWithPlaceholder(),
  }) {
    return RegistrationRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String,
      profileName:
          profileName == const $CopyWithPlaceholder() || profileName == null
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String,
      guildInvitationCode: guildInvitationCode == const $CopyWithPlaceholder()
          ? _value.guildInvitationCode
          // ignore: cast_nullable_to_non_nullable
          : guildInvitationCode as String?,
    );
  }
}

extension $RegistrationRequestCopyWith on RegistrationRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRegistrationRequest.copyWith(...)` or `instanceOfRegistrationRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegistrationRequestCWProxy get copyWith =>
      _$RegistrationRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequest _$RegistrationRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegistrationRequest', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'email',
          'password',
          'profileName',
          'guildInvitationCode',
        ],
      );
      final val = RegistrationRequest(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        profileName: $checkedConvert('profileName', (v) => v as String),
        guildInvitationCode: $checkedConvert(
          'guildInvitationCode',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegistrationRequestToJson(
  RegistrationRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'profileName': instance.profileName,
  'guildInvitationCode': instance.guildInvitationCode,
};
