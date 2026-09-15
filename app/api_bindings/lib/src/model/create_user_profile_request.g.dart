// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_profile_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateUserProfileRequestCWProxy {
  CreateUserProfileRequest guildId(String? guildId);

  CreateUserProfileRequest nickname(String? nickname);

  CreateUserProfileRequest profilePicture(String? profilePicture);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateUserProfileRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateUserProfileRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateUserProfileRequest call({
    String? guildId,
    String? nickname,
    String? profilePicture,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateUserProfileRequest.copyWith(...)` or call `instanceOfCreateUserProfileRequest.copyWith.fieldName(value)` for a single field.
class _$CreateUserProfileRequestCWProxyImpl
    implements _$CreateUserProfileRequestCWProxy {
  const _$CreateUserProfileRequestCWProxyImpl(this._value);

  final CreateUserProfileRequest _value;

  @override
  CreateUserProfileRequest guildId(String? guildId) => call(guildId: guildId);

  @override
  CreateUserProfileRequest nickname(String? nickname) =>
      call(nickname: nickname);

  @override
  CreateUserProfileRequest profilePicture(String? profilePicture) =>
      call(profilePicture: profilePicture);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateUserProfileRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateUserProfileRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateUserProfileRequest call({
    Object? guildId = const $CopyWithPlaceholder(),
    Object? nickname = const $CopyWithPlaceholder(),
    Object? profilePicture = const $CopyWithPlaceholder(),
  }) {
    return CreateUserProfileRequest(
      guildId: guildId == const $CopyWithPlaceholder()
          ? _value.guildId
          // ignore: cast_nullable_to_non_nullable
          : guildId as String?,
      nickname: nickname == const $CopyWithPlaceholder()
          ? _value.nickname
          // ignore: cast_nullable_to_non_nullable
          : nickname as String?,
      profilePicture: profilePicture == const $CopyWithPlaceholder()
          ? _value.profilePicture
          // ignore: cast_nullable_to_non_nullable
          : profilePicture as String?,
    );
  }
}

extension $CreateUserProfileRequestCopyWith on CreateUserProfileRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateUserProfileRequest.copyWith(...)` or `instanceOfCreateUserProfileRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateUserProfileRequestCWProxy get copyWith =>
      _$CreateUserProfileRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserProfileRequest _$CreateUserProfileRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateUserProfileRequest', json, ($checkedConvert) {
  final val = CreateUserProfileRequest(
    guildId: $checkedConvert('guildId', (v) => v as String?),
    nickname: $checkedConvert('nickname', (v) => v as String?),
    profilePicture: $checkedConvert('profilePicture', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$CreateUserProfileRequestToJson(
  CreateUserProfileRequest instance,
) => <String, dynamic>{
  'guildId': ?instance.guildId,
  'nickname': ?instance.nickname,
  'profilePicture': ?instance.profilePicture,
};
