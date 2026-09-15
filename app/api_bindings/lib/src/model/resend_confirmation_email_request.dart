//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_confirmation_email_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResendConfirmationEmailRequest {
  /// Returns a new [ResendConfirmationEmailRequest] instance.
  ResendConfirmationEmailRequest({required this.email});

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResendConfirmationEmailRequest && other.email == email;

  @override
  int get hashCode => email.hashCode;

  factory ResendConfirmationEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$ResendConfirmationEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResendConfirmationEmailRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
