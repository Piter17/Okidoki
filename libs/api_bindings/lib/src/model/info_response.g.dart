// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InfoResponseCWProxy {
  InfoResponse email(String email);

  InfoResponse isEmailConfirmed(bool isEmailConfirmed);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InfoResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InfoResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  InfoResponse call({String email, bool isEmailConfirmed});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfInfoResponse.copyWith(...)` or call `instanceOfInfoResponse.copyWith.fieldName(value)` for a single field.
class _$InfoResponseCWProxyImpl implements _$InfoResponseCWProxy {
  const _$InfoResponseCWProxyImpl(this._value);

  final InfoResponse _value;

  @override
  InfoResponse email(String email) => call(email: email);

  @override
  InfoResponse isEmailConfirmed(bool isEmailConfirmed) =>
      call(isEmailConfirmed: isEmailConfirmed);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `InfoResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// InfoResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  InfoResponse call({
    Object? email = const $CopyWithPlaceholder(),
    Object? isEmailConfirmed = const $CopyWithPlaceholder(),
  }) {
    return InfoResponse(
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

extension $InfoResponseCopyWith on InfoResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfInfoResponse.copyWith(...)` or `instanceOfInfoResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InfoResponseCWProxy get copyWith => _$InfoResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoResponse _$InfoResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InfoResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['email', 'isEmailConfirmed']);
      final val = InfoResponse(
        email: $checkedConvert('email', (v) => v as String),
        isEmailConfirmed: $checkedConvert('isEmailConfirmed', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$InfoResponseToJson(InfoResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'isEmailConfirmed': instance.isEmailConfirmed,
    };
