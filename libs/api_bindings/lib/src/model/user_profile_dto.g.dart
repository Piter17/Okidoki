// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileDtoCWProxy {
  UserProfileDto id(String id);

  UserProfileDto userName(String userName);

  UserProfileDto nickname(String? nickname);

  UserProfileDto state(UserOnlineState? state);

  UserProfileDto profilePicture(String? profilePicture);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UserProfileDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UserProfileDto(...).copyWith(id: 12, name: "My name")
  /// ```
  UserProfileDto call({
    String id,
    String userName,
    String? nickname,
    UserOnlineState? state,
    String? profilePicture,
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
  UserProfileDto userName(String userName) => call(userName: userName);

  @override
  UserProfileDto nickname(String? nickname) => call(nickname: nickname);

  @override
  UserProfileDto state(UserOnlineState? state) => call(state: state);

  @override
  UserProfileDto profilePicture(String? profilePicture) =>
      call(profilePicture: profilePicture);

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
    Object? userName = const $CopyWithPlaceholder(),
    Object? nickname = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? profilePicture = const $CopyWithPlaceholder(),
  }) {
    return UserProfileDto(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
      nickname: nickname == const $CopyWithPlaceholder()
          ? _value.nickname
          // ignore: cast_nullable_to_non_nullable
          : nickname as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as UserOnlineState?,
      profilePicture: profilePicture == const $CopyWithPlaceholder()
          ? _value.profilePicture
          // ignore: cast_nullable_to_non_nullable
          : profilePicture as String?,
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
      $checkKeys(json, requiredKeys: const ['id', 'userName']);
      final val = UserProfileDto(
        id: $checkedConvert('id', (v) => v as String),
        userName: $checkedConvert('userName', (v) => v as String),
        nickname: $checkedConvert('nickname', (v) => v as String?),
        state: $checkedConvert(
          'state',
          (v) => $enumDecodeNullable(_$UserOnlineStateEnumMap, v),
        ),
        profilePicture: $checkedConvert('profilePicture', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'nickname': ?instance.nickname,
      'state': ?_$UserOnlineStateEnumMap[instance.state],
      'profilePicture': ?instance.profilePicture,
    };

const _$UserOnlineStateEnumMap = {
  UserOnlineState.offline: 'Offline',
  UserOnlineState.dnd: 'Dnd',
  UserOnlineState.away: 'Away',
  UserOnlineState.online: 'Online',
};
