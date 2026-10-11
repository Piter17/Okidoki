//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_options.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PasswordOptions {
  /// Returns a new [PasswordOptions] instance.
  PasswordOptions({
    this.requiredLength,

    this.requiredUniqueChars,

    this.requireNonAlphanumeric,

    this.requireLowercase,

    this.requireUppercase,

    this.requireDigit,
  });

  @JsonKey(name: r'requiredLength', required: false, includeIfNull: false)
  final int? requiredLength;

  @JsonKey(name: r'requiredUniqueChars', required: false, includeIfNull: false)
  final int? requiredUniqueChars;

  @JsonKey(
    name: r'requireNonAlphanumeric',
    required: false,
    includeIfNull: false,
  )
  final bool? requireNonAlphanumeric;

  @JsonKey(name: r'requireLowercase', required: false, includeIfNull: false)
  final bool? requireLowercase;

  @JsonKey(name: r'requireUppercase', required: false, includeIfNull: false)
  final bool? requireUppercase;

  @JsonKey(name: r'requireDigit', required: false, includeIfNull: false)
  final bool? requireDigit;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordOptions &&
          other.requiredLength == requiredLength &&
          other.requiredUniqueChars == requiredUniqueChars &&
          other.requireNonAlphanumeric == requireNonAlphanumeric &&
          other.requireLowercase == requireLowercase &&
          other.requireUppercase == requireUppercase &&
          other.requireDigit == requireDigit;

  @override
  int get hashCode =>
      requiredLength.hashCode +
      requiredUniqueChars.hashCode +
      requireNonAlphanumeric.hashCode +
      requireLowercase.hashCode +
      requireUppercase.hashCode +
      requireDigit.hashCode;

  factory PasswordOptions.fromJson(Map<String, dynamic> json) =>
      _$PasswordOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordOptionsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
