//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_example_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateExampleRequest {
  /// Returns a new [UpdateExampleRequest] instance.
  UpdateExampleRequest({required this.name});

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateExampleRequest && other.name == name;

  @override
  int get hashCode => name.hashCode;

  factory UpdateExampleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateExampleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateExampleRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
