//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterResponse {
  /// Returns a new [RegisterResponse] instance.
  RegisterResponse({required this.userId, required this.userName});

  @JsonKey(name: r'userId', required: true, includeIfNull: false)
  final String userId;

  @JsonKey(name: r'userName', required: true, includeIfNull: false)
  final String userName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterResponse &&
          other.userId == userId &&
          other.userName == userName;

  @override
  int get hashCode => userId.hashCode + userName.hashCode;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
