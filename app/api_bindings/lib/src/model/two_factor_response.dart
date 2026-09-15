//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'two_factor_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TwoFactorResponse {
  /// Returns a new [TwoFactorResponse] instance.
  TwoFactorResponse({
    required this.sharedKey,

    required this.recoveryCodesLeft,

    this.recoveryCodes,

    required this.isTwoFactorEnabled,

    required this.isMachineRemembered,
  });

  @JsonKey(name: r'sharedKey', required: true, includeIfNull: false)
  final String sharedKey;

  @JsonKey(name: r'recoveryCodesLeft', required: true, includeIfNull: false)
  final int recoveryCodesLeft;

  @JsonKey(name: r'recoveryCodes', required: false, includeIfNull: false)
  final List<String>? recoveryCodes;

  @JsonKey(name: r'isTwoFactorEnabled', required: true, includeIfNull: false)
  final bool isTwoFactorEnabled;

  @JsonKey(name: r'isMachineRemembered', required: true, includeIfNull: false)
  final bool isMachineRemembered;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TwoFactorResponse &&
          other.sharedKey == sharedKey &&
          other.recoveryCodesLeft == recoveryCodesLeft &&
          other.recoveryCodes == recoveryCodes &&
          other.isTwoFactorEnabled == isTwoFactorEnabled &&
          other.isMachineRemembered == isMachineRemembered;

  @override
  int get hashCode =>
      sharedKey.hashCode +
      recoveryCodesLeft.hashCode +
      (recoveryCodes == null ? 0 : recoveryCodes.hashCode) +
      isTwoFactorEnabled.hashCode +
      isMachineRemembered.hashCode;

  factory TwoFactorResponse.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TwoFactorResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
