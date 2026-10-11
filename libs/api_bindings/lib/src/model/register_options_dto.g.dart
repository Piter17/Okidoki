// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_options_dto.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RegisterOptionsDtoCWProxy {
  RegisterOptionsDto anonymousRegister(AnonymousRegister anonymousRegister);

  RegisterOptionsDto password(PasswordOptions password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterOptionsDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterOptionsDto(...).copyWith(id: 12, name: "My name")
  /// ```
  RegisterOptionsDto call({
    AnonymousRegister anonymousRegister,
    PasswordOptions password,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfRegisterOptionsDto.copyWith(...)` or call `instanceOfRegisterOptionsDto.copyWith.fieldName(value)` for a single field.
class _$RegisterOptionsDtoCWProxyImpl implements _$RegisterOptionsDtoCWProxy {
  const _$RegisterOptionsDtoCWProxyImpl(this._value);

  final RegisterOptionsDto _value;

  @override
  RegisterOptionsDto anonymousRegister(AnonymousRegister anonymousRegister) =>
      call(anonymousRegister: anonymousRegister);

  @override
  RegisterOptionsDto password(PasswordOptions password) =>
      call(password: password);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `RegisterOptionsDto(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// RegisterOptionsDto(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  RegisterOptionsDto call({
    Object? anonymousRegister = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return RegisterOptionsDto(
      anonymousRegister:
          anonymousRegister == const $CopyWithPlaceholder() ||
              anonymousRegister == null
          ? _value.anonymousRegister
          // ignore: cast_nullable_to_non_nullable
          : anonymousRegister as AnonymousRegister,
      password: password == const $CopyWithPlaceholder() || password == null
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as PasswordOptions,
    );
  }
}

extension $RegisterOptionsDtoCopyWith on RegisterOptionsDto {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfRegisterOptionsDto.copyWith(...)` or `instanceOfRegisterOptionsDto.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RegisterOptionsDtoCWProxy get copyWith =>
      _$RegisterOptionsDtoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterOptionsDto _$RegisterOptionsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegisterOptionsDto', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['anonymousRegister', 'password']);
      final val = RegisterOptionsDto(
        anonymousRegister: $checkedConvert(
          'anonymousRegister',
          (v) => $enumDecode(_$AnonymousRegisterEnumMap, v),
        ),
        password: $checkedConvert(
          'password',
          (v) => PasswordOptions.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegisterOptionsDtoToJson(
  RegisterOptionsDto instance,
) => <String, dynamic>{
  'anonymousRegister': _$AnonymousRegisterEnumMap[instance.anonymousRegister]!,
  'password': instance.password.toJson(),
};

const _$AnonymousRegisterEnumMap = {
  AnonymousRegister.deny: 'Deny',
  AnonymousRegister.allowOnInvite: 'AllowOnInvite',
  AnonymousRegister.allow: 'Allow',
};
