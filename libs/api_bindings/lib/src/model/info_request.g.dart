// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InfoRequestCWProxy {
  InfoRequest newEmail(String? newEmail);

  InfoRequest newPassword(String? newPassword);

  InfoRequest oldPassword(String? oldPassword);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InfoRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InfoRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  InfoRequest call({
    String? newEmail,
    String? newPassword,
    String? oldPassword,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInfoRequest.copyWith(...)` or call `instanceOfInfoRequest.copyWith.fieldName(value)` for a single field.
class _$InfoRequestCWProxyImpl implements _$InfoRequestCWProxy {
  const _$InfoRequestCWProxyImpl(this._value);

  final InfoRequest _value;

  @override
  InfoRequest newEmail(String? newEmail) => call(newEmail: newEmail);

  @override
  InfoRequest newPassword(String? newPassword) =>
      call(newPassword: newPassword);

  @override
  InfoRequest oldPassword(String? oldPassword) =>
      call(oldPassword: oldPassword);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InfoRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InfoRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InfoRequest call({
    Object? newEmail = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
    Object? oldPassword = const $CopyWithPlaceholder(),
  }) {
    return InfoRequest(
      newEmail: newEmail == const $CopyWithPlaceholder()
          ? _value.newEmail
          // ignore: cast_nullable_to_non_nullable
          : newEmail as String?,
      newPassword: newPassword == const $CopyWithPlaceholder()
          ? _value.newPassword
          // ignore: cast_nullable_to_non_nullable
          : newPassword as String?,
      oldPassword: oldPassword == const $CopyWithPlaceholder()
          ? _value.oldPassword
          // ignore: cast_nullable_to_non_nullable
          : oldPassword as String?,
    );
  }
}

extension $InfoRequestCopyWith on InfoRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInfoRequest.copyWith(...)` or `instanceOfInfoRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InfoRequestCWProxy get copyWith => _$InfoRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoRequest _$InfoRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InfoRequest', json, ($checkedConvert) {
      final val = InfoRequest(
        newEmail: $checkedConvert('newEmail', (v) => v as String?),
        newPassword: $checkedConvert('newPassword', (v) => v as String?),
        oldPassword: $checkedConvert('oldPassword', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$InfoRequestToJson(InfoRequest instance) =>
    <String, dynamic>{
      'newEmail': ?instance.newEmail,
      'newPassword': ?instance.newPassword,
      'oldPassword': ?instance.oldPassword,
    };
