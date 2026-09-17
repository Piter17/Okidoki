// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_confirmation_email_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResendConfirmationEmailRequestCWProxy {
  ResendConfirmationEmailRequest email(String email);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ResendConfirmationEmailRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ResendConfirmationEmailRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  ResendConfirmationEmailRequest call({String email});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfResendConfirmationEmailRequest.copyWith(...)` or call `instanceOfResendConfirmationEmailRequest.copyWith.fieldName(value)` for a single field.
class _$ResendConfirmationEmailRequestCWProxyImpl
    implements _$ResendConfirmationEmailRequestCWProxy {
  const _$ResendConfirmationEmailRequestCWProxyImpl(this._value);

  final ResendConfirmationEmailRequest _value;

  @override
  ResendConfirmationEmailRequest email(String email) => call(email: email);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ResendConfirmationEmailRequest(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ResendConfirmationEmailRequest(...).copyWith(id: 12, name: "My name")
  /// ```
  @override
  ResendConfirmationEmailRequest call({
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return ResendConfirmationEmailRequest(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $ResendConfirmationEmailRequestCopyWith
    on ResendConfirmationEmailRequest {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfResendConfirmationEmailRequest.copyWith(...)` or `instanceOfResendConfirmationEmailRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResendConfirmationEmailRequestCWProxy get copyWith =>
      _$ResendConfirmationEmailRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResendConfirmationEmailRequest _$ResendConfirmationEmailRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ResendConfirmationEmailRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['email']);
  final val = ResendConfirmationEmailRequest(
    email: $checkedConvert('email', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ResendConfirmationEmailRequestToJson(
  ResendConfirmationEmailRequest instance,
) => <String, dynamic>{'email': instance.email};
