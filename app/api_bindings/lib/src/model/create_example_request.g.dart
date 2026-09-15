// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_example_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateExampleRequestCWProxy {
  CreateExampleRequest name(String name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateExampleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateExampleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateExampleRequest call({String name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateExampleRequest.copyWith(...)` or call `instanceOfCreateExampleRequest.copyWith.fieldName(value)` for a single field.
class _$CreateExampleRequestCWProxyImpl
    implements _$CreateExampleRequestCWProxy {
  const _$CreateExampleRequestCWProxyImpl(this._value);

  final CreateExampleRequest _value;

  @override
  CreateExampleRequest name(String name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateExampleRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateExampleRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateExampleRequest call({Object? name = const $CopyWithPlaceholder()}) {
    return CreateExampleRequest(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $CreateExampleRequestCopyWith on CreateExampleRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateExampleRequest.copyWith(...)` or `instanceOfCreateExampleRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateExampleRequestCWProxy get copyWith =>
      _$CreateExampleRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateExampleRequest _$CreateExampleRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateExampleRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['name']);
  final val = CreateExampleRequest(
    name: $checkedConvert('name', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$CreateExampleRequestToJson(
  CreateExampleRequest instance,
) => <String, dynamic>{'name': instance.name};
