// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_profile_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateUserProfileRequestCWProxy {
  UpdateUserProfileRequest profileName(String? profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateUserProfileRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateUserProfileRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateUserProfileRequest call({String? profileName});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateUserProfileRequest.copyWith(...)` or call `instanceOfUpdateUserProfileRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateUserProfileRequestCWProxyImpl
    implements _$UpdateUserProfileRequestCWProxy {
  const _$UpdateUserProfileRequestCWProxyImpl(this._value);

  final UpdateUserProfileRequest _value;

  @override
  UpdateUserProfileRequest profileName(String? profileName) =>
      call(profileName: profileName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateUserProfileRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateUserProfileRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateUserProfileRequest call({
    Object? profileName = const $CopyWithPlaceholder(),
  }) {
    return UpdateUserProfileRequest(
      profileName: profileName == const $CopyWithPlaceholder()
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String?,
    );
  }
}

extension $UpdateUserProfileRequestCopyWith on UpdateUserProfileRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateUserProfileRequest.copyWith(...)` or `instanceOfUpdateUserProfileRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateUserProfileRequestCWProxy get copyWith =>
      _$UpdateUserProfileRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserProfileRequest _$UpdateUserProfileRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateUserProfileRequest', json, ($checkedConvert) {
  final val = UpdateUserProfileRequest(
    profileName: $checkedConvert('profileName', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$UpdateUserProfileRequestToJson(
  UpdateUserProfileRequest instance,
) => <String, dynamic>{'profileName': ?instance.profileName};
