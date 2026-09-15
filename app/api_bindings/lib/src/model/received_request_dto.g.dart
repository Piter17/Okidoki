// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_request_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReceivedRequestDtoCWProxy {
  ReceivedRequestDto senderId(String senderId);

  ReceivedRequestDto sender(UserProfileDto sender);

  ReceivedRequestDto createdAt(DateTime createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ReceivedRequestDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ReceivedRequestDto(...).copyWith(id: 12, name: "My name")
  /// ```
  ReceivedRequestDto call({
    String senderId,
    UserProfileDto sender,
    DateTime createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfReceivedRequestDto.copyWith(...)` or call `instanceOfReceivedRequestDto.copyWith.fieldName(value)` for a single field.
class _$ReceivedRequestDtoCWProxyImpl implements _$ReceivedRequestDtoCWProxy {
  const _$ReceivedRequestDtoCWProxyImpl(this._value);

  final ReceivedRequestDto _value;

  @override
  ReceivedRequestDto senderId(String senderId) => call(senderId: senderId);

  @override
  ReceivedRequestDto sender(UserProfileDto sender) => call(sender: sender);

  @override
  ReceivedRequestDto createdAt(DateTime createdAt) =>
      call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ReceivedRequestDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ReceivedRequestDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ReceivedRequestDto call({
    Object? senderId = const $CopyWithPlaceholder(),
    Object? sender = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return ReceivedRequestDto(
      senderId: senderId == const $CopyWithPlaceholder() || senderId == null
          ? _value.senderId
          // ignore: cast_nullable_to_non_nullable
          : senderId as String,
      sender: sender == const $CopyWithPlaceholder() || sender == null
          ? _value.sender
          // ignore: cast_nullable_to_non_nullable
          : sender as UserProfileDto,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $ReceivedRequestDtoCopyWith on ReceivedRequestDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfReceivedRequestDto.copyWith(...)` or `instanceOfReceivedRequestDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReceivedRequestDtoCWProxy get copyWith =>
      _$ReceivedRequestDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedRequestDto _$ReceivedRequestDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ReceivedRequestDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['senderId', 'sender', 'createdAt']);
      final val = ReceivedRequestDto(
        senderId: $checkedConvert('senderId', (v) => v as String),
        sender: $checkedConvert(
          'sender',
          (v) => UserProfileDto.fromJson(v as Map<String, dynamic>),
        ),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ReceivedRequestDtoToJson(ReceivedRequestDto instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'sender': instance.sender.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
