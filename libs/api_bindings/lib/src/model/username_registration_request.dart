//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'username_registration_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UsernameRegistrationRequest {
  /// Returns a new [UsernameRegistrationRequest] instance.
  UsernameRegistrationRequest({required this.userName});

  @JsonKey(name: r'userName', required: true, includeIfNull: false)
  final String userName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsernameRegistrationRequest && other.userName == userName;

  @override
  int get hashCode => userName.hashCode;

  factory UsernameRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$UsernameRegistrationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsernameRegistrationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
