// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_request_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SentRequestDtoCWProxy {
  SentRequestDto targetId(String targetId);

  SentRequestDto target(UserProfileDto target);

  SentRequestDto createdAt(DateTime createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SentRequestDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SentRequestDto(...).copyWith(id: 12, name: "My name")
  /// ```
  SentRequestDto call({
    String targetId,
    UserProfileDto target,
    DateTime createdAt,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSentRequestDto.copyWith(...)` or call `instanceOfSentRequestDto.copyWith.fieldName(value)` for a single field.
class _$SentRequestDtoCWProxyImpl implements _$SentRequestDtoCWProxy {
  const _$SentRequestDtoCWProxyImpl(this._value);

  final SentRequestDto _value;

  @override
  SentRequestDto targetId(String targetId) => call(targetId: targetId);

  @override
  SentRequestDto target(UserProfileDto target) => call(target: target);

  @override
  SentRequestDto createdAt(DateTime createdAt) => call(createdAt: createdAt);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SentRequestDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SentRequestDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  SentRequestDto call({
    Object? targetId = const $CopyWithPlaceholder(),
    Object? target = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return SentRequestDto(
      targetId: targetId == const $CopyWithPlaceholder() || targetId == null
          ? _value.targetId
          // ignore: cast_nullable_to_non_nullable
          : targetId as String,
      target: target == const $CopyWithPlaceholder() || target == null
          ? _value.target
          // ignore: cast_nullable_to_non_nullable
          : target as UserProfileDto,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
    );
  }
}

extension $SentRequestDtoCopyWith on SentRequestDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSentRequestDto.copyWith(...)` or `instanceOfSentRequestDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SentRequestDtoCWProxy get copyWith => _$SentRequestDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SentRequestDto _$SentRequestDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SentRequestDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['targetId', 'target', 'createdAt']);
      final val = SentRequestDto(
        targetId: $checkedConvert('targetId', (v) => v as String),
        target: $checkedConvert(
          'target',
          (v) => UserProfileDto.fromJson(v as Map<String, dynamic>),
        ),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SentRequestDtoToJson(SentRequestDto instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'target': instance.target.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
