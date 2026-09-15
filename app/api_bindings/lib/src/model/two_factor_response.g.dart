// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TwoFactorResponseCWProxy {
  TwoFactorResponse sharedKey(String sharedKey);

  TwoFactorResponse recoveryCodesLeft(int recoveryCodesLeft);

  TwoFactorResponse recoveryCodes(List<String>? recoveryCodes);

  TwoFactorResponse isTwoFactorEnabled(bool isTwoFactorEnabled);

  TwoFactorResponse isMachineRemembered(bool isMachineRemembered);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TwoFactorResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TwoFactorResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  TwoFactorResponse call({
    String sharedKey,
    int recoveryCodesLeft,
    List<String>? recoveryCodes,
    bool isTwoFactorEnabled,
    bool isMachineRemembered,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTwoFactorResponse.copyWith(...)` or call `instanceOfTwoFactorResponse.copyWith.fieldName(value)` for a single field.
class _$TwoFactorResponseCWProxyImpl implements _$TwoFactorResponseCWProxy {
  const _$TwoFactorResponseCWProxyImpl(this._value);

  final TwoFactorResponse _value;

  @override
  TwoFactorResponse sharedKey(String sharedKey) => call(sharedKey: sharedKey);

  @override
  TwoFactorResponse recoveryCodesLeft(int recoveryCodesLeft) =>
      call(recoveryCodesLeft: recoveryCodesLeft);

  @override
  TwoFactorResponse recoveryCodes(List<String>? recoveryCodes) =>
      call(recoveryCodes: recoveryCodes);

  @override
  TwoFactorResponse isTwoFactorEnabled(bool isTwoFactorEnabled) =>
      call(isTwoFactorEnabled: isTwoFactorEnabled);

  @override
  TwoFactorResponse isMachineRemembered(bool isMachineRemembered) =>
      call(isMachineRemembered: isMachineRemembered);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TwoFactorResponse(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TwoFactorResponse(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  TwoFactorResponse call({
    Object? sharedKey = const $CopyWithPlaceholder(),
    Object? recoveryCodesLeft = const $CopyWithPlaceholder(),
    Object? recoveryCodes = const $CopyWithPlaceholder(),
    Object? isTwoFactorEnabled = const $CopyWithPlaceholder(),
    Object? isMachineRemembered = const $CopyWithPlaceholder(),
  }) {
    return TwoFactorResponse(
      sharedKey: sharedKey == const $CopyWithPlaceholder() || sharedKey == null
          ? _value.sharedKey
          // ignore: cast_nullable_to_non_nullable
          : sharedKey as String,
      recoveryCodesLeft:
          recoveryCodesLeft == const $CopyWithPlaceholder() ||
              recoveryCodesLeft == null
          ? _value.recoveryCodesLeft
          // ignore: cast_nullable_to_non_nullable
          : recoveryCodesLeft as int,
      recoveryCodes: recoveryCodes == const $CopyWithPlaceholder()
          ? _value.recoveryCodes
          // ignore: cast_nullable_to_non_nullable
          : recoveryCodes as List<String>?,
      isTwoFactorEnabled:
          isTwoFactorEnabled == const $CopyWithPlaceholder() ||
              isTwoFactorEnabled == null
          ? _value.isTwoFactorEnabled
          // ignore: cast_nullable_to_non_nullable
          : isTwoFactorEnabled as bool,
      isMachineRemembered:
          isMachineRemembered == const $CopyWithPlaceholder() ||
              isMachineRemembered == null
          ? _value.isMachineRemembered
          // ignore: cast_nullable_to_non_nullable
          : isMachineRemembered as bool,
    );
  }
}

extension $TwoFactorResponseCopyWith on TwoFactorResponse {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTwoFactorResponse.copyWith(...)` or `instanceOfTwoFactorResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TwoFactorResponseCWProxy get copyWith =>
      _$TwoFactorResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwoFactorResponse _$TwoFactorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TwoFactorResponse', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'sharedKey',
          'recoveryCodesLeft',
          'isTwoFactorEnabled',
          'isMachineRemembered',
        ],
      );
      final val = TwoFactorResponse(
        sharedKey: $checkedConvert('sharedKey', (v) => v as String),
        recoveryCodesLeft: $checkedConvert(
          'recoveryCodesLeft',
          (v) => (v as num).toInt(),
        ),
        recoveryCodes: $checkedConvert(
          'recoveryCodes',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        isTwoFactorEnabled: $checkedConvert(
          'isTwoFactorEnabled',
          (v) => v as bool,
        ),
        isMachineRemembered: $checkedConvert(
          'isMachineRemembered',
          (v) => v as bool,
        ),
      );
      return val;
    });

Map<String, dynamic> _$TwoFactorResponseToJson(TwoFactorResponse instance) =>
    <String, dynamic>{
      'sharedKey': instance.sharedKey,
      'recoveryCodesLeft': instance.recoveryCodesLeft,
      'recoveryCodes': ?instance.recoveryCodes,
      'isTwoFactorEnabled': instance.isTwoFactorEnabled,
      'isMachineRemembered': instance.isMachineRemembered,
    };
