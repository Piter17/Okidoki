// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_guild_invitation_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateGuildInvitationRequestCWProxy {
  CreateGuildInvitationRequest validUntil(DateTime? validUntil);

  CreateGuildInvitationRequest maxUses(int? maxUses);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateGuildInvitationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateGuildInvitationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  CreateGuildInvitationRequest call({DateTime? validUntil, int? maxUses});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCreateGuildInvitationRequest.copyWith(...)` or call `instanceOfCreateGuildInvitationRequest.copyWith.fieldName(value)` for a single field.
class _$CreateGuildInvitationRequestCWProxyImpl
    implements _$CreateGuildInvitationRequestCWProxy {
  const _$CreateGuildInvitationRequestCWProxyImpl(this._value);

  final CreateGuildInvitationRequest _value;

  @override
  CreateGuildInvitationRequest validUntil(DateTime? validUntil) =>
      call(validUntil: validUntil);

  @override
  CreateGuildInvitationRequest maxUses(int? maxUses) => call(maxUses: maxUses);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CreateGuildInvitationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CreateGuildInvitationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  CreateGuildInvitationRequest call({
    Object? validUntil = const $CopyWithPlaceholder(),
    Object? maxUses = const $CopyWithPlaceholder(),
  }) {
    return CreateGuildInvitationRequest(
      validUntil: validUntil == const $CopyWithPlaceholder()
          ? _value.validUntil
          // ignore: cast_nullable_to_non_nullable
          : validUntil as DateTime?,
      maxUses: maxUses == const $CopyWithPlaceholder()
          ? _value.maxUses
          // ignore: cast_nullable_to_non_nullable
          : maxUses as int?,
    );
  }
}

extension $CreateGuildInvitationRequestCopyWith
    on CreateGuildInvitationRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCreateGuildInvitationRequest.copyWith(...)` or `instanceOfCreateGuildInvitationRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateGuildInvitationRequestCWProxy get copyWith =>
      _$CreateGuildInvitationRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGuildInvitationRequest _$CreateGuildInvitationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CreateGuildInvitationRequest', json, ($checkedConvert) {
  final val = CreateGuildInvitationRequest(
    validUntil: $checkedConvert(
      'validUntil',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    maxUses: $checkedConvert('maxUses', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$CreateGuildInvitationRequestToJson(
  CreateGuildInvitationRequest instance,
) => <String, dynamic>{
  'validUntil': ?instance.validUntil?.toIso8601String(),
  'maxUses': ?instance.maxUses,
};
