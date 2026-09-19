// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_registration_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UsernameRegistrationRequestCWProxy {
  UsernameRegistrationRequest userName(String userName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UsernameRegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UsernameRegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UsernameRegistrationRequest call({String userName});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUsernameRegistrationRequest.copyWith(...)` or call `instanceOfUsernameRegistrationRequest.copyWith.fieldName(value)` for a single field.
class _$UsernameRegistrationRequestCWProxyImpl
    implements _$UsernameRegistrationRequestCWProxy {
  const _$UsernameRegistrationRequestCWProxyImpl(this._value);

  final UsernameRegistrationRequest _value;

  @override
  UsernameRegistrationRequest userName(String userName) =>
      call(userName: userName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UsernameRegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UsernameRegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UsernameRegistrationRequest call({
    Object? userName = const $CopyWithPlaceholder(),
  }) {
    return UsernameRegistrationRequest(
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
    );
  }
}

extension $UsernameRegistrationRequestCopyWith on UsernameRegistrationRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUsernameRegistrationRequest.copyWith(...)` or `instanceOfUsernameRegistrationRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UsernameRegistrationRequestCWProxy get copyWith =>
      _$UsernameRegistrationRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsernameRegistrationRequest _$UsernameRegistrationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UsernameRegistrationRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['userName']);
  final val = UsernameRegistrationRequest(
    userName: $checkedConvert('userName', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$UsernameRegistrationRequestToJson(
  UsernameRegistrationRequest instance,
) => <String, dynamic>{'userName': instance.userName};
