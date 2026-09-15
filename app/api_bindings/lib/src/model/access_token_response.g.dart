// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccessTokenResponseCWProxy {
  AccessTokenResponse tokenType(String? tokenType);

  AccessTokenResponse accessToken(String accessToken);

  AccessTokenResponse expiresIn(String expiresIn);

  AccessTokenResponse refreshToken(String refreshToken);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AccessTokenResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AccessTokenResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  AccessTokenResponse call({
    String? tokenType,
    String accessToken,
    String expiresIn,
    String refreshToken,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAccessTokenResponse.copyWith(...)` or call `instanceOfAccessTokenResponse.copyWith.fieldName(value)` for a single field.
class _$AccessTokenResponseCWProxyImpl implements _$AccessTokenResponseCWProxy {
  const _$AccessTokenResponseCWProxyImpl(this._value);

  final AccessTokenResponse _value;

  @override
  AccessTokenResponse tokenType(String? tokenType) =>
      call(tokenType: tokenType);

  @override
  AccessTokenResponse accessToken(String accessToken) =>
      call(accessToken: accessToken);

  @override
  AccessTokenResponse expiresIn(String expiresIn) => call(expiresIn: expiresIn);

  @override
  AccessTokenResponse refreshToken(String refreshToken) =>
      call(refreshToken: refreshToken);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AccessTokenResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AccessTokenResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AccessTokenResponse call({
    Object? tokenType = const $CopyWithPlaceholder(),
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? expiresIn = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
  }) {
    return AccessTokenResponse(
      tokenType: tokenType == const $CopyWithPlaceholder()
          ? _value.tokenType
          // ignore: cast_nullable_to_non_nullable
          : tokenType as String?,
      accessToken:
          accessToken == const $CopyWithPlaceholder() || accessToken == null
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String,
      expiresIn: expiresIn == const $CopyWithPlaceholder() || expiresIn == null
          ? _value.expiresIn
          // ignore: cast_nullable_to_non_nullable
          : expiresIn as String,
      refreshToken:
          refreshToken == const $CopyWithPlaceholder() || refreshToken == null
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String,
    );
  }
}

extension $AccessTokenResponseCopyWith on AccessTokenResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAccessTokenResponse.copyWith(...)` or `instanceOfAccessTokenResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccessTokenResponseCWProxy get copyWith =>
      _$AccessTokenResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenResponse _$AccessTokenResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AccessTokenResponse', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['accessToken', 'expiresIn', 'refreshToken'],
      );
      final val = AccessTokenResponse(
        tokenType: $checkedConvert('tokenType', (v) => v as String?),
        accessToken: $checkedConvert('accessToken', (v) => v as String),
        expiresIn: $checkedConvert('expiresIn', (v) => v as String),
        refreshToken: $checkedConvert('refreshToken', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AccessTokenResponseToJson(
  AccessTokenResponse instance,
) => <String, dynamic>{
  'tokenType': ?instance.tokenType,
  'accessToken': instance.accessToken,
  'expiresIn': instance.expiresIn,
  'refreshToken': instance.refreshToken,
};
