//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InfoRequest {
  /// Returns a new [InfoRequest] instance.
  InfoRequest({this.newEmail, this.newPassword, this.oldPassword});

  @JsonKey(name: r'newEmail', required: false, includeIfNull: false)
  final String? newEmail;

  @JsonKey(name: r'newPassword', required: false, includeIfNull: false)
  final String? newPassword;

  @JsonKey(name: r'oldPassword', required: false, includeIfNull: false)
  final String? oldPassword;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoRequest &&
          other.newEmail == newEmail &&
          other.newPassword == newPassword &&
          other.oldPassword == oldPassword;

  @override
  int get hashCode =>
      (newEmail == null ? 0 : newEmail.hashCode) +
      (newPassword == null ? 0 : newPassword.hashCode) +
      (oldPassword == null ? 0 : oldPassword.hashCode);

  factory InfoRequest.fromJson(Map<String, dynamic> json) =>
      _$InfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InfoRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
