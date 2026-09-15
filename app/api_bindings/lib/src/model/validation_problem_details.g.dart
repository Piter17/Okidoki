// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_problem_details.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ValidationProblemDetailsCWProxy {
  ValidationProblemDetails type(String? type);

  ValidationProblemDetails title(String? title);

  ValidationProblemDetails status(int? status);

  ValidationProblemDetails detail(String? detail);

  ValidationProblemDetails instance(String? instance);

  ValidationProblemDetails errors(Map<String, List<String>>? errors);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ValidationProblemDetails(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ValidationProblemDetails(...).copyWith(id: 12, name: "My name")
  /// ```
  ValidationProblemDetails call({
    String? type,
    String? title,
    int? status,
    String? detail,
    String? instance,
    Map<String, List<String>>? errors,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfValidationProblemDetails.copyWith(...)` or call `instanceOfValidationProblemDetails.copyWith.fieldName(value)` for a single field.
class _$ValidationProblemDetailsCWProxyImpl
    implements _$ValidationProblemDetailsCWProxy {
  const _$ValidationProblemDetailsCWProxyImpl(this._value);

  final ValidationProblemDetails _value;

  @override
  ValidationProblemDetails type(String? type) => call(type: type);

  @override
  ValidationProblemDetails title(String? title) => call(title: title);

  @override
  ValidationProblemDetails status(int? status) => call(status: status);

  @override
  ValidationProblemDetails detail(String? detail) => call(detail: detail);

  @override
  ValidationProblemDetails instance(String? instance) =>
      call(instance: instance);

  @override
  ValidationProblemDetails errors(Map<String, List<String>>? errors) =>
      call(errors: errors);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ValidationProblemDetails(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ValidationProblemDetails(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ValidationProblemDetails call({
    Object? type = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? instance = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ValidationProblemDetails(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as String?,
      instance: instance == const $CopyWithPlaceholder()
          ? _value.instance
          // ignore: cast_nullable_to_non_nullable
          : instance as String?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Map<String, List<String>>?,
    );
  }
}

extension $ValidationProblemDetailsCopyWith on ValidationProblemDetails {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfValidationProblemDetails.copyWith(...)` or `instanceOfValidationProblemDetails.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValidationProblemDetailsCWProxy get copyWith =>
      _$ValidationProblemDetailsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationProblemDetails _$ValidationProblemDetailsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ValidationProblemDetails', json, ($checkedConvert) {
  final val = ValidationProblemDetails(
    type: $checkedConvert('type', (v) => v as String?),
    title: $checkedConvert('title', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    detail: $checkedConvert('detail', (v) => v as String?),
    instance: $checkedConvert('instance', (v) => v as String?),
    errors: $checkedConvert(
      'errors',
      (v) => (v as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ValidationProblemDetailsToJson(
  ValidationProblemDetails instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'title': ?instance.title,
  'status': ?instance.status,
  'detail': ?instance.detail,
  'instance': ?instance.instance,
  'errors': ?instance.errors,
};
