// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_response_id.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InfoResponseIdCWProxy {
  InfoResponseId userId(int userId);

  InfoResponseId userName(String userName);

  InfoResponseId email(String email);

  InfoResponseId isEmailConfirmed(bool isEmailConfirmed);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InfoResponseId(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InfoResponseId(...).copyWith(id: 12, name: "My name")
  /// ```
  InfoResponseId call({
    int userId,
    String userName,
    String email,
    bool isEmailConfirmed,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInfoResponseId.copyWith(...)` or call `instanceOfInfoResponseId.copyWith.fieldName(value)` for a single field.
class _$InfoResponseIdCWProxyImpl implements _$InfoResponseIdCWProxy {
  const _$InfoResponseIdCWProxyImpl(this._value);

  final InfoResponseId _value;

  @override
  InfoResponseId userId(int userId) => call(userId: userId);

  @override
  InfoResponseId userName(String userName) => call(userName: userName);

  @override
  InfoResponseId email(String email) => call(email: email);

  @override
  InfoResponseId isEmailConfirmed(bool isEmailConfirmed) =>
      call(isEmailConfirmed: isEmailConfirmed);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InfoResponseId(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InfoResponseId(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InfoResponseId call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? isEmailConfirmed = const $CopyWithPlaceholder(),
  }) {
    return InfoResponseId(
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      isEmailConfirmed:
          isEmailConfirmed == const $CopyWithPlaceholder() ||
              isEmailConfirmed == null
          ? _value.isEmailConfirmed
          // ignore: cast_nullable_to_non_nullable
          : isEmailConfirmed as bool,
    );
  }
}

extension $InfoResponseIdCopyWith on InfoResponseId {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInfoResponseId.copyWith(...)` or `instanceOfInfoResponseId.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InfoResponseIdCWProxy get copyWith => _$InfoResponseIdCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponseId _$InfoResponseIdFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InfoResponseId', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['userId', 'userName', 'email', 'isEmailConfirmed'],
      );
      final val = InfoResponseId(
        userId: $checkedConvert('userId', (v) => (v as num).toInt()),
        userName: $checkedConvert('userName', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        isEmailConfirmed: $checkedConvert('isEmailConfirmed', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$InfoResponseIdToJson(InfoResponseId instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'isEmailConfirmed': instance.isEmailConfirmed,
    };
