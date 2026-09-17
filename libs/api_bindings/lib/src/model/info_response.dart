//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InfoResponse {
  /// Returns a new [InfoResponse] instance.
  InfoResponse({required this.email, required this.isEmailConfirmed});

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'isEmailConfirmed', required: true, includeIfNull: false)
  final bool isEmailConfirmed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoResponse &&
          other.email == email &&
          other.isEmailConfirmed == isEmailConfirmed;

  @override
  int get hashCode => email.hashCode + isEmailConfirmed.hashCode;

  factory InfoResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
