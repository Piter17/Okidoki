// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_options.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PasswordOptionsCWProxy {
  PasswordOptions requiredLength(int? requiredLength);

  PasswordOptions requiredUniqueChars(int? requiredUniqueChars);

  PasswordOptions requireNonAlphanumeric(bool? requireNonAlphanumeric);

  PasswordOptions requireLowercase(bool? requireLowercase);

  PasswordOptions requireUppercase(bool? requireUppercase);

  PasswordOptions requireDigit(bool? requireDigit);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `PasswordOptions(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PasswordOptions(...).copyWith(id: 12, name: "My name")
  /// ```
  PasswordOptions call({
    int? requiredLength,
    int? requiredUniqueChars,
    bool? requireNonAlphanumeric,
    bool? requireLowercase,
    bool? requireUppercase,
    bool? requireDigit,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfPasswordOptions.copyWith(...)` or call `instanceOfPasswordOptions.copyWith.fieldName(value)` for a single field.
class _$PasswordOptionsCWProxyImpl implements _$PasswordOptionsCWProxy {
  const _$PasswordOptionsCWProxyImpl(this._value);

  final PasswordOptions _value;

  @override
  PasswordOptions requiredLength(int? requiredLength) =>
      call(requiredLength: requiredLength);

  @override
  PasswordOptions requiredUniqueChars(int? requiredUniqueChars) =>
      call(requiredUniqueChars: requiredUniqueChars);

  @override
  PasswordOptions requireNonAlphanumeric(bool? requireNonAlphanumeric) =>
      call(requireNonAlphanumeric: requireNonAlphanumeric);

  @override
  PasswordOptions requireLowercase(bool? requireLowercase) =>
      call(requireLowercase: requireLowercase);

  @override
  PasswordOptions requireUppercase(bool? requireUppercase) =>
      call(requireUppercase: requireUppercase);

  @override
  PasswordOptions requireDigit(bool? requireDigit) =>
      call(requireDigit: requireDigit);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `PasswordOptions(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// PasswordOptions(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  PasswordOptions call({
    Object? requiredLength = const $CopyWithPlaceholder(),
    Object? requiredUniqueChars = const $CopyWithPlaceholder(),
    Object? requireNonAlphanumeric = const $CopyWithPlaceholder(),
    Object? requireLowercase = const $CopyWithPlaceholder(),
    Object? requireUppercase = const $CopyWithPlaceholder(),
    Object? requireDigit = const $CopyWithPlaceholder(),
  }) {
    return PasswordOptions(
      requiredLength: requiredLength == const $CopyWithPlaceholder()
          ? _value.requiredLength
          // ignore: cast_nullable_to_non_nullable
          : requiredLength as int?,
      requiredUniqueChars: requiredUniqueChars == const $CopyWithPlaceholder()
          ? _value.requiredUniqueChars
          // ignore: cast_nullable_to_non_nullable
          : requiredUniqueChars as int?,
      requireNonAlphanumeric:
          requireNonAlphanumeric == const $CopyWithPlaceholder()
          ? _value.requireNonAlphanumeric
          // ignore: cast_nullable_to_non_nullable
          : requireNonAlphanumeric as bool?,
      requireLowercase: requireLowercase == const $CopyWithPlaceholder()
          ? _value.requireLowercase
          // ignore: cast_nullable_to_non_nullable
          : requireLowercase as bool?,
      requireUppercase: requireUppercase == const $CopyWithPlaceholder()
          ? _value.requireUppercase
          // ignore: cast_nullable_to_non_nullable
          : requireUppercase as bool?,
      requireDigit: requireDigit == const $CopyWithPlaceholder()
          ? _value.requireDigit
          // ignore: cast_nullable_to_non_nullable
          : requireDigit as bool?,
    );
  }
}

extension $PasswordOptionsCopyWith on PasswordOptions {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfPasswordOptions.copyWith(...)` or `instanceOfPasswordOptions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PasswordOptionsCWProxy get copyWith => _$PasswordOptionsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordOptions _$PasswordOptionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasswordOptions', json, ($checkedConvert) {
  final val = PasswordOptions(
    requiredLength: $checkedConvert(
      'requiredLength',
      (v) => (v as num?)?.toInt(),
    ),
    requiredUniqueChars: $checkedConvert(
      'requiredUniqueChars',
      (v) => (v as num?)?.toInt(),
    ),
    requireNonAlphanumeric: $checkedConvert(
      'requireNonAlphanumeric',
      (v) => v as bool?,
    ),
    requireLowercase: $checkedConvert('requireLowercase', (v) => v as bool?),
    requireUppercase: $checkedConvert('requireUppercase', (v) => v as bool?),
    requireDigit: $checkedConvert('requireDigit', (v) => v as bool?),
  );
  return val;
});

Map<String, dynamic> _$PasswordOptionsToJson(PasswordOptions instance) =>
    <String, dynamic>{
      'requiredLength': ?instance.requiredLength,
      'requiredUniqueChars': ?instance.requiredUniqueChars,
      'requireNonAlphanumeric': ?instance.requireNonAlphanumeric,
      'requireLowercase': ?instance.requireLowercase,
      'requireUppercase': ?instance.requireUppercase,
      'requireDigit': ?instance.requireDigit,
    };
