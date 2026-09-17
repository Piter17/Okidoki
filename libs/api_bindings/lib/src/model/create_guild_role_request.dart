//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_guild_role_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateGuildRoleRequest {
  /// Returns a new [CreateGuildRoleRequest] instance.
  CreateGuildRoleRequest({this.name});

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateGuildRoleRequest && other.name == name;

  @override
  int get hashCode => name.hashCode;

  factory CreateGuildRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateGuildRoleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGuildRoleRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
