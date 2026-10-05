// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:api_bindings/src/model/access_token_response.dart';
import 'package:api_bindings/src/model/add_credentials_request.dart';
import 'package:api_bindings/src/model/anonymus_registration_request.dart';
import 'package:api_bindings/src/model/chat_message_dto.dart';
import 'package:api_bindings/src/model/create_chat_message_request.dart';
import 'package:api_bindings/src/model/create_guild_channel_request.dart';
import 'package:api_bindings/src/model/create_guild_invitation_request.dart';
import 'package:api_bindings/src/model/create_guild_role_request.dart';
import 'package:api_bindings/src/model/create_user_profile_request.dart';
import 'package:api_bindings/src/model/forgot_password_request.dart';
import 'package:api_bindings/src/model/friend_dto.dart';
import 'package:api_bindings/src/model/full_registration_request.dart';
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
import 'package:api_bindings/src/model/registration_request.dart';
import 'package:api_bindings/src/model/resend_confirmation_email_request.dart';
import 'package:api_bindings/src/model/reset_password_request.dart';
import 'package:api_bindings/src/model/sent_request_dto.dart';
import 'package:api_bindings/src/model/two_factor_request.dart';
import 'package:api_bindings/src/model/two_factor_response.dart';
import 'package:api_bindings/src/model/update_chat_message_request.dart';
import 'package:api_bindings/src/model/update_guild_name_request.dart';
import 'package:api_bindings/src/model/update_user_profile_request.dart';
import 'package:api_bindings/src/model/user_profile_dto.dart';
import 'package:api_bindings/src/model/username_registration_request.dart';

typedef Decoder = Object Function(dynamic);
class JsonConverter {
  static T fromJson<T>(dynamic json) {
    final factory = _factories[T];
    if (factory == null) throw StateError('No JSON factory registered for type T.');
    return factory(json) as T;
  }

  static T? tryFromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    return factory == null ? null : factory(json) as T;
  }

  static final Map<Type, Decoder> _factories = {
    String: (json) => '$json',
    DateTime: (json) => DateTime.parse('$json'),
    AccessTokenResponse: (json) => AccessTokenResponse.fromJson(json as Map<String, dynamic>),
    AddCredentialsRequest: (json) => AddCredentialsRequest.fromJson(json as Map<String, dynamic>),
    AnonymusRegistrationRequest: (json) => AnonymusRegistrationRequest.fromJson(json as Map<String, dynamic>),
    ChatMessageDto: (json) => ChatMessageDto.fromJson(json as Map<String, dynamic>),
    CreateChatMessageRequest: (json) => CreateChatMessageRequest.fromJson(json as Map<String, dynamic>),
    CreateGuildChannelRequest: (json) => CreateGuildChannelRequest.fromJson(json as Map<String, dynamic>),
    CreateGuildInvitationRequest: (json) => CreateGuildInvitationRequest.fromJson(json as Map<String, dynamic>),
    CreateGuildRoleRequest: (json) => CreateGuildRoleRequest.fromJson(json as Map<String, dynamic>),
    CreateUserProfileRequest: (json) => CreateUserProfileRequest.fromJson(json as Map<String, dynamic>),
    ForgotPasswordRequest: (json) => ForgotPasswordRequest.fromJson(json as Map<String, dynamic>),
    FriendDto: (json) => FriendDto.fromJson(json as Map<String, dynamic>),
    FullRegistrationRequest: (json) => FullRegistrationRequest.fromJson(json as Map<String, dynamic>),
    GuildChannelDto: (json) => GuildChannelDto.fromJson(json as Map<String, dynamic>),
    GuildDto: (json) => GuildDto.fromJson(json as Map<String, dynamic>),
    GuildInvitationDto: (json) => GuildInvitationDto.fromJson(json as Map<String, dynamic>),
    GuildProfileDto: (json) => GuildProfileDto.fromJson(json as Map<String, dynamic>),
    GuildRoleDto: (json) => GuildRoleDto.fromJson(json as Map<String, dynamic>),
    HttpValidationProblemDetails: (json) => HttpValidationProblemDetails.fromJson(json as Map<String, dynamic>),
    IdentityDto: (json) => IdentityDto.fromJson(json as Map<String, dynamic>),
    InfoRequest: (json) => InfoRequest.fromJson(json as Map<String, dynamic>),
    InfoResponse: (json) => InfoResponse.fromJson(json as Map<String, dynamic>),
    LoginRequest: (json) => LoginRequest.fromJson(json as Map<String, dynamic>),
    ReceivedRequestDto: (json) => ReceivedRequestDto.fromJson(json as Map<String, dynamic>),
    RefreshRequest: (json) => RefreshRequest.fromJson(json as Map<String, dynamic>),
    RegisterRequest: (json) => RegisterRequest.fromJson(json as Map<String, dynamic>),
    RegisterResponse: (json) => RegisterResponse.fromJson(json as Map<String, dynamic>),
    RegistrationRequest: (json) => RegistrationRequest.fromJson(json as Map<String, dynamic>),
    ResendConfirmationEmailRequest: (json) => ResendConfirmationEmailRequest.fromJson(json as Map<String, dynamic>),
    ResetPasswordRequest: (json) => ResetPasswordRequest.fromJson(json as Map<String, dynamic>),
    SentRequestDto: (json) => SentRequestDto.fromJson(json as Map<String, dynamic>),
    TwoFactorRequest: (json) => TwoFactorRequest.fromJson(json as Map<String, dynamic>),
    TwoFactorResponse: (json) => TwoFactorResponse.fromJson(json as Map<String, dynamic>),
    UpdateChatMessageRequest: (json) => UpdateChatMessageRequest.fromJson(json as Map<String, dynamic>),
    UpdateGuildNameRequest: (json) => UpdateGuildNameRequest.fromJson(json as Map<String, dynamic>),
    UpdateUserProfileRequest: (json) => UpdateUserProfileRequest.fromJson(json as Map<String, dynamic>),
    UserProfileDto: (json) => UserProfileDto.fromJson(json as Map<String, dynamic>),
    UsernameRegistrationRequest: (json) => UsernameRegistrationRequest.fromJson(json as Map<String, dynamic>),
  };
}
