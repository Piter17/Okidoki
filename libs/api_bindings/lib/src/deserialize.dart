import 'package:api_bindings/src/model/access_token_response.dart';
import 'package:api_bindings/src/model/chat_message_dto.dart';
import 'package:api_bindings/src/model/create_chat_message_request.dart';
import 'package:api_bindings/src/model/create_guild_channel_request.dart';
import 'package:api_bindings/src/model/create_guild_invitation_request.dart';
import 'package:api_bindings/src/model/create_guild_role_request.dart';
import 'package:api_bindings/src/model/create_user_profile_request.dart';
import 'package:api_bindings/src/model/forgot_password_request.dart';
import 'package:api_bindings/src/model/friend_dto.dart';
import 'package:api_bindings/src/model/guild_channel_dto.dart';
import 'package:api_bindings/src/model/guild_dto.dart';
import 'package:api_bindings/src/model/guild_invitation_dto.dart';
import 'package:api_bindings/src/model/guild_profile_dto.dart';
import 'package:api_bindings/src/model/guild_role_dto.dart';
import 'package:api_bindings/src/model/http_validation_problem_details.dart';
import 'package:api_bindings/src/model/identity_dto.dart';
import 'package:api_bindings/src/model/info_request.dart';
import 'package:api_bindings/src/model/info_response.dart';
import 'package:api_bindings/src/model/login_request.dart';
import 'package:api_bindings/src/model/received_request_dto.dart';
import 'package:api_bindings/src/model/refresh_request.dart';
import 'package:api_bindings/src/model/register_request.dart';
import 'package:api_bindings/src/model/register_response.dart';
import 'package:api_bindings/src/model/resend_confirmation_email_request.dart';
import 'package:api_bindings/src/model/reset_password_request.dart';
import 'package:api_bindings/src/model/sent_request_dto.dart';
import 'package:api_bindings/src/model/two_factor_request.dart';
import 'package:api_bindings/src/model/two_factor_response.dart';
import 'package:api_bindings/src/model/update_chat_message_request.dart';
import 'package:api_bindings/src/model/update_guild_name_request.dart';
import 'package:api_bindings/src/model/update_user_profile_request.dart';
import 'package:api_bindings/src/model/user_profile_dto.dart';
import 'package:api_bindings/src/model/user_register_request.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(
  dynamic value,
  String targetType, {
  bool growable = true,
}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'AccessTokenResponse':
      return AccessTokenResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ChannelType':
    case 'ChatMessageDto':
      return ChatMessageDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateChatMessageRequest':
      return CreateChatMessageRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateGuildChannelRequest':
      return CreateGuildChannelRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateGuildInvitationRequest':
      return CreateGuildInvitationRequest.fromJson(
        value as Map<String, dynamic>,
      ) as ReturnType;
    case 'CreateGuildRoleRequest':
      return CreateGuildRoleRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateUserProfileRequest':
      return CreateUserProfileRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ForgotPasswordRequest':
      return ForgotPasswordRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'FriendDto':
      return FriendDto.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'GuildChannelDto':
      return GuildChannelDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'GuildDto':
      return GuildDto.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'GuildInvitationDto':
      return GuildInvitationDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'GuildProfileDto':
      return GuildProfileDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'GuildRoleDto':
      return GuildRoleDto.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'HttpValidationProblemDetails':
      return HttpValidationProblemDetails.fromJson(
        value as Map<String, dynamic>,
      ) as ReturnType;
    case 'IdentityDto':
      return IdentityDto.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'InfoRequest':
      return InfoRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'InfoResponse':
      return InfoResponse.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LoginRequest':
      return LoginRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'QueryDirection':
    case 'ReceivedRequestDto':
      return ReceivedRequestDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RefreshRequest':
      return RefreshRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RegisterRequest':
      return RegisterRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RegisterResponse':
      return RegisterResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ResendConfirmationEmailRequest':
      return ResendConfirmationEmailRequest.fromJson(
        value as Map<String, dynamic>,
      ) as ReturnType;
    case 'ResetPasswordRequest':
      return ResetPasswordRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SentRequestDto':
      return SentRequestDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TwoFactorRequest':
      return TwoFactorRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TwoFactorResponse':
      return TwoFactorResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateChatMessageRequest':
      return UpdateChatMessageRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateGuildNameRequest':
      return UpdateGuildNameRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateUserProfileRequest':
      return UpdateUserProfileRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserProfileDto':
      return UserProfileDto.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserRegisterRequest':
      return UserRegisterRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toList(growable: growable)
            as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toSet()
            as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
          value.keys as Iterable<String>,
          value.values.map(
            (dynamic v) => deserialize<BaseType, BaseType>(
              v,
              targetType,
              growable: growable,
            ),
          ),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
