// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FriendDtoCWProxy {
  FriendDto userId(String userId);

  FriendDto userName(String userName);

  FriendDto nickname(String? nickname);

  FriendDto createdAt(DateTime? createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FriendDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FriendDto(...).copyWith(id: 12, name: "My name")
  /// ```
  FriendDto call({
    String userId,
    String userName,
    String? nickname,
    DateTime? createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFriendDto.copyWith(...)` or call `instanceOfFriendDto.copyWith.fieldName(value)` for a single field.
class _$FriendDtoCWProxyImpl implements _$FriendDtoCWProxy {
  const _$FriendDtoCWProxyImpl(this._value);

  final FriendDto _value;

  @override
  FriendDto userId(String userId) => call(userId: userId);

  @override
  FriendDto userName(String userName) => call(userName: userName);

  @override
  FriendDto nickname(String? nickname) => call(nickname: nickname);

  @override
  FriendDto createdAt(DateTime? createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FriendDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FriendDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FriendDto call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? nickname = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return FriendDto(
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
      nickname: nickname == const $CopyWithPlaceholder()
          ? _value.nickname
          // ignore: cast_nullable_to_non_nullable
          : nickname as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $FriendDtoCopyWith on FriendDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFriendDto.copyWith(...)` or `instanceOfFriendDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FriendDtoCWProxy get copyWith => _$FriendDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendDto _$FriendDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FriendDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['userId', 'userName']);
      final val = FriendDto(
        userId: $checkedConvert('userId', (v) => v as String),
        userName: $checkedConvert('userName', (v) => v as String),
        nickname: $checkedConvert('nickname', (v) => v as String?),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FriendDtoToJson(FriendDto instance) => <String, dynamic>{
  'userId': instance.userId,
  'userName': instance.userName,
  'nickname': ?instance.nickname,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};
