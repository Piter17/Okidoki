// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FriendRequestDtoCWProxy {
  FriendRequestDto senderId(int senderId);

  FriendRequestDto senderUserName(String? senderUserName);

  FriendRequestDto targetId(int targetId);

  FriendRequestDto targetUserName(String? targetUserName);

  FriendRequestDto state(String? state);

  FriendRequestDto createdAt(DateTime? createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FriendRequestDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FriendRequestDto(...).copyWith(id: 12, name: "My name")
  /// ```
  FriendRequestDto call({
    int senderId,
    String? senderUserName,
    int targetId,
    String? targetUserName,
    String? state,
    DateTime? createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFriendRequestDto.copyWith(...)` or call `instanceOfFriendRequestDto.copyWith.fieldName(value)` for a single field.
class _$FriendRequestDtoCWProxyImpl implements _$FriendRequestDtoCWProxy {
  const _$FriendRequestDtoCWProxyImpl(this._value);

  final FriendRequestDto _value;

  @override
  FriendRequestDto senderId(int senderId) => call(senderId: senderId);

  @override
  FriendRequestDto senderUserName(String? senderUserName) =>
      call(senderUserName: senderUserName);

  @override
  FriendRequestDto targetId(int targetId) => call(targetId: targetId);

  @override
  FriendRequestDto targetUserName(String? targetUserName) =>
      call(targetUserName: targetUserName);

  @override
  FriendRequestDto state(String? state) => call(state: state);

  @override
  FriendRequestDto createdAt(DateTime? createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FriendRequestDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FriendRequestDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  FriendRequestDto call({
    Object? senderId = const $CopyWithPlaceholder(),
    Object? senderUserName = const $CopyWithPlaceholder(),
    Object? targetId = const $CopyWithPlaceholder(),
    Object? targetUserName = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return FriendRequestDto(
      senderId: senderId == const $CopyWithPlaceholder() || senderId == null
          ? _value.senderId
          // ignore: cast_nullable_to_non_nullable
          : senderId as int,
      senderUserName: senderUserName == const $CopyWithPlaceholder()
          ? _value.senderUserName
          // ignore: cast_nullable_to_non_nullable
          : senderUserName as String?,
      targetId: targetId == const $CopyWithPlaceholder() || targetId == null
          ? _value.targetId
          // ignore: cast_nullable_to_non_nullable
          : targetId as int,
      targetUserName: targetUserName == const $CopyWithPlaceholder()
          ? _value.targetUserName
          // ignore: cast_nullable_to_non_nullable
          : targetUserName as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $FriendRequestDtoCopyWith on FriendRequestDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFriendRequestDto.copyWith(...)` or `instanceOfFriendRequestDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FriendRequestDtoCWProxy get copyWith => _$FriendRequestDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendRequestDto _$FriendRequestDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FriendRequestDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['senderId', 'targetId']);
      final val = FriendRequestDto(
        senderId: $checkedConvert('senderId', (v) => (v as num).toInt()),
        senderUserName: $checkedConvert('senderUserName', (v) => v as String?),
        targetId: $checkedConvert('targetId', (v) => (v as num).toInt()),
        targetUserName: $checkedConvert('targetUserName', (v) => v as String?),
        state: $checkedConvert('state', (v) => v as String?),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FriendRequestDtoToJson(FriendRequestDto instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'senderUserName': ?instance.senderUserName,
      'targetId': instance.targetId,
      'targetUserName': ?instance.targetUserName,
      'state': ?instance.state,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };
