// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_example_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpdateExampleRequestCWProxy {
  UpdateExampleRequest name(String name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateExampleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateExampleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  UpdateExampleRequest call({String name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfUpdateExampleRequest.copyWith(...)` or call `instanceOfUpdateExampleRequest.copyWith.fieldName(value)` for a single field.
class _$UpdateExampleRequestCWProxyImpl
    implements _$UpdateExampleRequestCWProxy {
  const _$UpdateExampleRequestCWProxyImpl(this._value);

  final UpdateExampleRequest _value;

  @override
  UpdateExampleRequest name(String name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `UpdateExampleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// UpdateExampleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  UpdateExampleRequest call({Object? name = const $CopyWithPlaceholder()}) {
    return UpdateExampleRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $UpdateExampleRequestCopyWith on UpdateExampleRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfUpdateExampleRequest.copyWith(...)` or `instanceOfUpdateExampleRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpdateExampleRequestCWProxy get copyWith =>
      _$UpdateExampleRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateExampleRequest _$UpdateExampleRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateExampleRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name']);
  final val = UpdateExampleRequest(
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$UpdateExampleRequestToJson(
  UpdateExampleRequest instance,
) => <String, dynamic>{'name': instance.name};
