//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_bindings/src/model/password_options.dart';
import 'package:api_bindings/src/model/anonymous_register.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_options_dto.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterOptionsDto {
  /// Returns a new [RegisterOptionsDto] instance.
  RegisterOptionsDto({required this.anonymousRegister, required this.password});

  @JsonKey(name: r'anonymousRegister', required: true, includeIfNull: false)
  final AnonymousRegister anonymousRegister;

  @JsonKey(name: r'password', required: true, includeIfNull: false)
  final PasswordOptions password;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterOptionsDto &&
          other.anonymousRegister == anonymousRegister &&
          other.password == password;

  @override
  int get hashCode => anonymousRegister.hashCode + password.hashCode;

  factory RegisterOptionsDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterOptionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterOptionsDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
