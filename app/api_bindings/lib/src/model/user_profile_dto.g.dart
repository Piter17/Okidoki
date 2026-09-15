// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileDtoCWProxy {
  UserProfileDto id(String id);

  UserProfileDto userId(String userId);

  UserProfileDto guildId(String? guildId);

  UserProfileDto nickname(String? nickname);

  UserProfileDto profilePicture(String? profilePicture);

  UserProfileDto userName(String? userName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UserProfileDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UserProfileDto(...).copyWith(id: 12, name: "My name")
  /// ```
  UserProfileDto call({
    String id,
    String userId,
    String? guildId,
    String? nickname,
    String? profilePicture,
    String? userName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUserProfileDto.copyWith(...)` or call `instanceOfUserProfileDto.copyWith.fieldName(value)` for a single field.
class _$UserProfileDtoCWProxyImpl implements _$UserProfileDtoCWProxy {
  const _$UserProfileDtoCWProxyImpl(this._value);

  final UserProfileDto _value;

  @override
  UserProfileDto id(String id) => call(id: id);

  @override
  UserProfileDto userId(String userId) => call(userId: userId);

  @override
  UserProfileDto guildId(String? guildId) => call(guildId: guildId);

  @override
  UserProfileDto nickname(String? nickname) => call(nickname: nickname);

  @override
  UserProfileDto profilePicture(String? profilePicture) =>
      call(profilePicture: profilePicture);

  @override
  UserProfileDto userName(String? userName) => call(userName: userName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UserProfileDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UserProfileDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UserProfileDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? guildId = const $CopyWithPlaceholder(),
    Object? nickname = const $CopyWithPlaceholder(),
    Object? profilePicture = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return UserProfileDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
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
      userName: userName == const $CopyWithPlaceholder()
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String?,
    );
  }
}

extension $UserProfileDtoCopyWith on UserProfileDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUserProfileDto.copyWith(...)` or `instanceOfUserProfileDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserProfileDtoCWProxy get copyWith => _$UserProfileDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserProfileDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'userId']);
      final val = UserProfileDto(
        id: $checkedConvert('id', (v) => v as String),
        userId: $checkedConvert('userId', (v) => v as String),
        guildId: $checkedConvert('guildId', (v) => v as String?),
        nickname: $checkedConvert('nickname', (v) => v as String?),
        profilePicture: $checkedConvert('profilePicture', (v) => v as String?),
        userName: $checkedConvert('userName', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'guildId': ?instance.guildId,
      'nickname': ?instance.nickname,
      'profilePicture': ?instance.profilePicture,
      'userName': ?instance.userName,
    };
