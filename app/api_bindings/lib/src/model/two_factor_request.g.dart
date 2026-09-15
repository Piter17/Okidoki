// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TwoFactorRequestCWProxy {
  TwoFactorRequest enable(bool? enable);

  TwoFactorRequest twoFactorCode(String? twoFactorCode);

  TwoFactorRequest resetSharedKey(bool? resetSharedKey);

  TwoFactorRequest resetRecoveryCodes(bool? resetRecoveryCodes);

  TwoFactorRequest forgetMachine(bool? forgetMachine);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TwoFactorRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TwoFactorRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  TwoFactorRequest call({
    bool? enable,
    String? twoFactorCode,
    bool? resetSharedKey,
    bool? resetRecoveryCodes,
    bool? forgetMachine,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTwoFactorRequest.copyWith(...)` or call `instanceOfTwoFactorRequest.copyWith.fieldName(value)` for a single field.
class _$TwoFactorRequestCWProxyImpl implements _$TwoFactorRequestCWProxy {
  const _$TwoFactorRequestCWProxyImpl(this._value);

  final TwoFactorRequest _value;

  @override
  TwoFactorRequest enable(bool? enable) => call(enable: enable);

  @override
  TwoFactorRequest twoFactorCode(String? twoFactorCode) =>
      call(twoFactorCode: twoFactorCode);

  @override
  TwoFactorRequest resetSharedKey(bool? resetSharedKey) =>
      call(resetSharedKey: resetSharedKey);

  @override
  TwoFactorRequest resetRecoveryCodes(bool? resetRecoveryCodes) =>
      call(resetRecoveryCodes: resetRecoveryCodes);

  @override
  TwoFactorRequest forgetMachine(bool? forgetMachine) =>
      call(forgetMachine: forgetMachine);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TwoFactorRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TwoFactorRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  TwoFactorRequest call({
    Object? enable = const $CopyWithPlaceholder(),
    Object? twoFactorCode = const $CopyWithPlaceholder(),
    Object? resetSharedKey = const $CopyWithPlaceholder(),
    Object? resetRecoveryCodes = const $CopyWithPlaceholder(),
    Object? forgetMachine = const $CopyWithPlaceholder(),
  }) {
    return TwoFactorRequest(
      enable: enable == const $CopyWithPlaceholder()
          ? _value.enable
          // ignore: cast_nullable_to_non_nullable
          : enable as bool?,
      twoFactorCode: twoFactorCode == const $CopyWithPlaceholder()
          ? _value.twoFactorCode
          // ignore: cast_nullable_to_non_nullable
          : twoFactorCode as String?,
      resetSharedKey: resetSharedKey == const $CopyWithPlaceholder()
          ? _value.resetSharedKey
          // ignore: cast_nullable_to_non_nullable
          : resetSharedKey as bool?,
      resetRecoveryCodes: resetRecoveryCodes == const $CopyWithPlaceholder()
          ? _value.resetRecoveryCodes
          // ignore: cast_nullable_to_non_nullable
          : resetRecoveryCodes as bool?,
      forgetMachine: forgetMachine == const $CopyWithPlaceholder()
          ? _value.forgetMachine
          // ignore: cast_nullable_to_non_nullable
          : forgetMachine as bool?,
    );
  }
}

extension $TwoFactorRequestCopyWith on TwoFactorRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTwoFactorRequest.copyWith(...)` or `instanceOfTwoFactorRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TwoFactorRequestCWProxy get copyWith => _$TwoFactorRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwoFactorRequest _$TwoFactorRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TwoFactorRequest', json, ($checkedConvert) {
      final val = TwoFactorRequest(
        enable: $checkedConvert('enable', (v) => v as bool?),
        twoFactorCode: $checkedConvert('twoFactorCode', (v) => v as String?),
        resetSharedKey: $checkedConvert('resetSharedKey', (v) => v as bool?),
        resetRecoveryCodes: $checkedConvert(
          'resetRecoveryCodes',
          (v) => v as bool?,
        ),
        forgetMachine: $checkedConvert('forgetMachine', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$TwoFactorRequestToJson(TwoFactorRequest instance) =>
    <String, dynamic>{
      'enable': ?instance.enable,
      'twoFactorCode': ?instance.twoFactorCode,
      'resetSharedKey': ?instance.resetSharedKey,
      'resetRecoveryCodes': ?instance.resetRecoveryCodes,
      'forgetMachine': ?instance.forgetMachine,
    };
