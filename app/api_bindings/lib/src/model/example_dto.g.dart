// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExampleDtoCWProxy {
  ExampleDto id(int? id);

  ExampleDto name(String name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ExampleDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ExampleDto(...).copyWith(id: 12, name: "My name")
  /// ```
  ExampleDto call({int? id, String name});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfExampleDto.copyWith(...)` or call `instanceOfExampleDto.copyWith.fieldName(value)` for a single field.
class _$ExampleDtoCWProxyImpl implements _$ExampleDtoCWProxy {
  const _$ExampleDtoCWProxyImpl(this._value);

  final ExampleDto _value;

  @override
  ExampleDto id(int? id) => call(id: id);

  @override
  ExampleDto name(String name) => call(name: name);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ExampleDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ExampleDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ExampleDto call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return ExampleDto(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
    );
  }
}

extension $ExampleDtoCopyWith on ExampleDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfExampleDto.copyWith(...)` or `instanceOfExampleDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExampleDtoCWProxy get copyWith => _$ExampleDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleDto _$ExampleDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ExampleDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['name']);
      final val = ExampleDto(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ExampleDtoToJson(ExampleDto instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': instance.name};
