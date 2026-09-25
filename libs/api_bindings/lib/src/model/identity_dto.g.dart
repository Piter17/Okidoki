// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IdentityDtoCWProxy {
  IdentityDto userName(String userName);

  IdentityDto email(String? email);

  IdentityDto userId(String userId);

  IdentityDto isEmailConfirmed(bool isEmailConfirmed);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `IdentityDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// IdentityDto(...).copyWith(id: 12, name: "My name")
  /// ```
  IdentityDto call({
    String userName,
    String? email,
    String userId,
    bool isEmailConfirmed,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfIdentityDto.copyWith(...)` or call `instanceOfIdentityDto.copyWith.fieldName(value)` for a single field.
class _$IdentityDtoCWProxyImpl implements _$IdentityDtoCWProxy {
  const _$IdentityDtoCWProxyImpl(this._value);

  final IdentityDto _value;

  @override
  IdentityDto userName(String userName) => call(userName: userName);

  @override
  IdentityDto email(String? email) => call(email: email);

  @override
  IdentityDto userId(String userId) => call(userId: userId);

  @override
  IdentityDto isEmailConfirmed(bool isEmailConfirmed) =>
      call(isEmailConfirmed: isEmailConfirmed);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `IdentityDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// IdentityDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  IdentityDto call({
    Object? userName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
    Object? isEmailConfirmed = const $CopyWithPlaceholder(),
  }) {
    return IdentityDto(
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      isEmailConfirmed:
          isEmailConfirmed == const $CopyWithPlaceholder() ||
              isEmailConfirmed == null
          ? _value.isEmailConfirmed
          // ignore: cast_nullable_to_non_nullable
          : isEmailConfirmed as bool,
    );
  }
}

extension $IdentityDtoCopyWith on IdentityDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfIdentityDto.copyWith(...)` or `instanceOfIdentityDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IdentityDtoCWProxy get copyWith => _$IdentityDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityDto _$IdentityDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('IdentityDto', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['userName', 'userId', 'isEmailConfirmed'],
      );
      final val = IdentityDto(
        userName: $checkedConvert('userName', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => v as String),
        isEmailConfirmed: $checkedConvert('isEmailConfirmed', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$IdentityDtoToJson(IdentityDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': ?instance.email,
      'userId': instance.userId,
      'isEmailConfirmed': instance.isEmailConfirmed,
    };
