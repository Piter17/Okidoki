//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccessTokenResponse {
  /// Returns a new [AccessTokenResponse] instance.
  AccessTokenResponse({
    this.tokenType,

    required this.accessToken,

    required this.expiresIn,

    required this.refreshToken,
  });

  @JsonKey(name: r'tokenType', required: false, includeIfNull: false)
  final String? tokenType;

  @JsonKey(name: r'accessToken', required: true, includeIfNull: false)
  final String accessToken;

  @JsonKey(name: r'expiresIn', required: true, includeIfNull: false)
  final String expiresIn;

  @JsonKey(name: r'refreshToken', required: true, includeIfNull: false)
  final String refreshToken;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessTokenResponse &&
          other.tokenType == tokenType &&
          other.accessToken == accessToken &&
          other.expiresIn == expiresIn &&
          other.refreshToken == refreshToken;

  @override
  int get hashCode =>
      (tokenType == null ? 0 : tokenType.hashCode) +
      accessToken.hashCode +
      expiresIn.hashCode +
      refreshToken.hashCode;

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
