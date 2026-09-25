// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anonymus_registration_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnonymusRegistrationRequestCWProxy {
  AnonymusRegistrationRequest profileName(String profileName);

  AnonymusRegistrationRequest guildInvitationCode(String? guildInvitationCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AnonymusRegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AnonymusRegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  AnonymusRegistrationRequest call({
    String profileName,
    String? guildInvitationCode,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAnonymusRegistrationRequest.copyWith(...)` or call `instanceOfAnonymusRegistrationRequest.copyWith.fieldName(value)` for a single field.
class _$AnonymusRegistrationRequestCWProxyImpl
    implements _$AnonymusRegistrationRequestCWProxy {
  const _$AnonymusRegistrationRequestCWProxyImpl(this._value);

  final AnonymusRegistrationRequest _value;

  @override
  AnonymusRegistrationRequest profileName(String profileName) =>
      call(profileName: profileName);

  @override
  AnonymusRegistrationRequest guildInvitationCode(
    String? guildInvitationCode,
  ) => call(guildInvitationCode: guildInvitationCode);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AnonymusRegistrationRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AnonymusRegistrationRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  AnonymusRegistrationRequest call({
    Object? profileName = const $CopyWithPlaceholder(),
    Object? guildInvitationCode = const $CopyWithPlaceholder(),
  }) {
    return AnonymusRegistrationRequest(
      profileName:
          profileName == const $CopyWithPlaceholder() || profileName == null
          ? _value.profileName
          // ignore: cast_nullable_to_non_nullable
          : profileName as String,
      guildInvitationCode: guildInvitationCode == const $CopyWithPlaceholder()
          ? _value.guildInvitationCode
          // ignore: cast_nullable_to_non_nullable
          : guildInvitationCode as String?,
    );
  }
}

extension $AnonymusRegistrationRequestCopyWith on AnonymusRegistrationRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAnonymusRegistrationRequest.copyWith(...)` or `instanceOfAnonymusRegistrationRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnonymusRegistrationRequestCWProxy get copyWith =>
      _$AnonymusRegistrationRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnonymusRegistrationRequest _$AnonymusRegistrationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AnonymusRegistrationRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['profileName', 'guildInvitationCode']);
  final val = AnonymusRegistrationRequest(
    profileName: $checkedConvert('profileName', (v) => v as String),
    guildInvitationCode: $checkedConvert(
      'guildInvitationCode',
      (v) => v as String?,
    ),
  );
  return val;
});

Map<String, dynamic> _$AnonymusRegistrationRequestToJson(
  AnonymusRegistrationRequest instance,
) => <String, dynamic>{
  'profileName': instance.profileName,
  'guildInvitationCode': instance.guildInvitationCode,
};
