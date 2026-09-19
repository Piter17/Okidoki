//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_credentials_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddCredentialsRequest {
  /// Returns a new [AddCredentialsRequest] instance.
  AddCredentialsRequest({required this.email, required this.password});

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'password', required: true, includeIfNull: false)
  final String password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddCredentialsRequest &&
          other.email == email &&
          other.password == password;

  @override
  int get hashCode => email.hashCode + password.hashCode;

  factory AddCredentialsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCredentialsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddCredentialsRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
