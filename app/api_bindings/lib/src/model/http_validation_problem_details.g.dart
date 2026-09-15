// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_validation_problem_details.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HttpValidationProblemDetailsCWProxy {
  HttpValidationProblemDetails type(String? type);

  HttpValidationProblemDetails title(String? title);

  HttpValidationProblemDetails status(int? status);

  HttpValidationProblemDetails detail(String? detail);

  HttpValidationProblemDetails instance(String? instance);

  HttpValidationProblemDetails errors(Map<String, List<String>>? errors);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HttpValidationProblemDetails(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HttpValidationProblemDetails(...).copyWith(id: 12, name: "My name")
  /// ```
  HttpValidationProblemDetails call({
    String? type,
    String? title,
    int? status,
    String? detail,
    String? instance,
    Map<String, List<String>>? errors,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfHttpValidationProblemDetails.copyWith(...)` or call `instanceOfHttpValidationProblemDetails.copyWith.fieldName(value)` for a single field.
class _$HttpValidationProblemDetailsCWProxyImpl
    implements _$HttpValidationProblemDetailsCWProxy {
  const _$HttpValidationProblemDetailsCWProxyImpl(this._value);

  final HttpValidationProblemDetails _value;

  @override
  HttpValidationProblemDetails type(String? type) => call(type: type);

  @override
  HttpValidationProblemDetails title(String? title) => call(title: title);

  @override
  HttpValidationProblemDetails status(int? status) => call(status: status);

  @override
  HttpValidationProblemDetails detail(String? detail) => call(detail: detail);

  @override
  HttpValidationProblemDetails instance(String? instance) =>
      call(instance: instance);

  @override
  HttpValidationProblemDetails errors(Map<String, List<String>>? errors) =>
      call(errors: errors);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `HttpValidationProblemDetails(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// HttpValidationProblemDetails(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  HttpValidationProblemDetails call({
    Object? type = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? instance = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return HttpValidationProblemDetails(
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

extension $HttpValidationProblemDetailsCopyWith
    on HttpValidationProblemDetails {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfHttpValidationProblemDetails.copyWith(...)` or `instanceOfHttpValidationProblemDetails.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HttpValidationProblemDetailsCWProxy get copyWith =>
      _$HttpValidationProblemDetailsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpValidationProblemDetails _$HttpValidationProblemDetailsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('HttpValidationProblemDetails', json, ($checkedConvert) {
  final val = HttpValidationProblemDetails(
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

Map<String, dynamic> _$HttpValidationProblemDetailsToJson(
  HttpValidationProblemDetails instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'title': ?instance.title,
  'status': ?instance.status,
  'detail': ?instance.detail,
  'instance': ?instance.instance,
  'errors': ?instance.errors,
};
