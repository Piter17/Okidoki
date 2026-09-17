// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterResponseCWProxy {
  RegisterResponse userId(String userId);

  RegisterResponse userName(String userName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  RegisterResponse call({String userId, String userName});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRegisterResponse.copyWith(...)` or call `instanceOfRegisterResponse.copyWith.fieldName(value)` for a single field.
class _$RegisterResponseCWProxyImpl implements _$RegisterResponseCWProxy {
  const _$RegisterResponseCWProxyImpl(this._value);

  final RegisterResponse _value;

  @override
  RegisterResponse userId(String userId) => call(userId: userId);

  @override
  RegisterResponse userName(String userName) => call(userName: userName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RegisterResponse call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return RegisterResponse(
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
    );
  }
}

extension $RegisterResponseCopyWith on RegisterResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRegisterResponse.copyWith(...)` or `instanceOfRegisterResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterResponseCWProxy get copyWith => _$RegisterResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['userId', 'userName']);
      final val = RegisterResponse(
        userId: $checkedConvert('userId', (v) => v as String),
        userName: $checkedConvert('userName', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{'userId': instance.userId, 'userName': instance.userName};
