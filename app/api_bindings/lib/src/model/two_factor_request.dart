//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'two_factor_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TwoFactorRequest {
  /// Returns a new [TwoFactorRequest] instance.
  TwoFactorRequest({
    this.enable,

    this.twoFactorCode,

    this.resetSharedKey,

    this.resetRecoveryCodes,

    this.forgetMachine,
  });

  @JsonKey(name: r'enable', required: false, includeIfNull: false)
  final bool? enable;

  @JsonKey(name: r'twoFactorCode', required: false, includeIfNull: false)
  final String? twoFactorCode;

  @JsonKey(name: r'resetSharedKey', required: false, includeIfNull: false)
  final bool? resetSharedKey;

  @JsonKey(name: r'resetRecoveryCodes', required: false, includeIfNull: false)
  final bool? resetRecoveryCodes;

  @JsonKey(name: r'forgetMachine', required: false, includeIfNull: false)
  final bool? forgetMachine;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TwoFactorRequest &&
          other.enable == enable &&
          other.twoFactorCode == twoFactorCode &&
          other.resetSharedKey == resetSharedKey &&
          other.resetRecoveryCodes == resetRecoveryCodes &&
          other.forgetMachine == forgetMachine;

  @override
  int get hashCode =>
      (enable == null ? 0 : enable.hashCode) +
      (twoFactorCode == null ? 0 : twoFactorCode.hashCode) +
      resetSharedKey.hashCode +
      resetRecoveryCodes.hashCode +
      forgetMachine.hashCode;

  factory TwoFactorRequest.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TwoFactorRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
