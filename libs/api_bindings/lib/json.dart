// GENERATED CODE - DO NOT MODIFY BY HAND
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

typedef Decoder = Object Function(Map<String, dynamic>);

class JsonConverter {
  static T fromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    if (factory == null) throw StateError('No JSON factory registered for type T.');
    return factory(json) as T;
  }

  static T? tryFromJson<T>(Map<String, dynamic> json) {
    final factory = _factories[T];
    return factory == null ? null : factory(json) as T;
  }

  static final Map<Type, Decoder> _factories = {
    AccessTokenResponse: AccessTokenResponse.fromJson,
    ChatMessageDto: ChatMessageDto.fromJson,
    CreateChatMessageRequest: CreateChatMessageRequest.fromJson,
    CreateGuildChannelRequest: CreateGuildChannelRequest.fromJson,
    CreateGuildInvitationRequest: CreateGuildInvitationRequest.fromJson,
    CreateGuildRoleRequest: CreateGuildRoleRequest.fromJson,
    CreateUserProfileRequest: CreateUserProfileRequest.fromJson,
    ForgotPasswordRequest: ForgotPasswordRequest.fromJson,
    FriendDto: FriendDto.fromJson,
    GuildChannelDto: GuildChannelDto.fromJson,
    GuildDto: GuildDto.fromJson,
    GuildInvitationDto: GuildInvitationDto.fromJson,
    GuildProfileDto: GuildProfileDto.fromJson,
    GuildRoleDto: GuildRoleDto.fromJson,
    HttpValidationProblemDetails: HttpValidationProblemDetails.fromJson,
    IdentityDto: IdentityDto.fromJson,
    InfoRequest: InfoRequest.fromJson,
    InfoResponse: InfoResponse.fromJson,
    LoginRequest: LoginRequest.fromJson,
    ReceivedRequestDto: ReceivedRequestDto.fromJson,
    RefreshRequest: RefreshRequest.fromJson,
    RegisterRequest: RegisterRequest.fromJson,
    RegisterResponse: RegisterResponse.fromJson,
    ResendConfirmationEmailRequest: ResendConfirmationEmailRequest.fromJson,
    ResetPasswordRequest: ResetPasswordRequest.fromJson,
    SentRequestDto: SentRequestDto.fromJson,
    TwoFactorRequest: TwoFactorRequest.fromJson,
    TwoFactorResponse: TwoFactorResponse.fromJson,
    UpdateChatMessageRequest: UpdateChatMessageRequest.fromJson,
    UpdateGuildNameRequest: UpdateGuildNameRequest.fromJson,
    UpdateUserProfileRequest: UpdateUserProfileRequest.fromJson,
    UserProfileDto: UserProfileDto.fromJson,
    UserRegisterRequest: UserRegisterRequest.fromJson,
  };
}
