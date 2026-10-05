import 'package:api_bindings/api_bindings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okidoki/utils/utils.dart';
part 'user.freezed.dart';

@freezed
class User({
  required final int id,
  required final String? email,
  required final String userName,
  required final boolisEmailConfirmed,
}) with _$User {
  factory fromDto(IdentityDto dto) => User(
    id: dto.userId.toInt(),
    email: dto.email,
    userName: dto.userName,
    boolisEmailConfirmed: dto.isEmailConfirmed,
  );
}

@Freezed(copyWith: false)
class UserProfile._({
  required final int id,
  required final String userName,
  required final String? _nickname,
  required final UserOnlineState? state,
  required final String? profilePicture,
}) with _$UserProfile {
  factory fromDto(UserProfileDto dto) => UserProfile._(
    id: dto.id.toInt(),
    userName: dto.userName,
    nickname: dto.nickname,
    state: dto.state,
    profilePicture: dto.profilePicture,
  );

  String get nickname => _nickname ?? userName;

  static final _skeletons = List.generate(
    10,
    (index) => UserProfile._(
      id: 0,
      userName: TextGen.nick(),
      nickname: TextGen.nick(),
      state: .offline,
      profilePicture: null,
    ),
  );

  factory fake(int index) => _skeletons[index % 10];
}

@freezed
class SentRequest({
  required final int targetId,
  required final UserProfile target,
  required final DateTime? createdAt,
}) with _$SentRequest {
  factory fromDto(SentRequestDto dto) => SentRequest(
    targetId: dto.targetId.toInt(),
    target: UserProfile.fromDto(dto.target),
    createdAt: dto.createdAt,
  );
}

@freezed
class ReceivedRequest({
  required final int senderId,
  required final UserProfile sender,
  required final DateTime? createdAt,
}) with _$ReceivedRequest {
  factory fromDto(ReceivedRequestDto dto) => ReceivedRequest(
    senderId: dto.senderId.toInt(),
    sender: UserProfile.fromDto(dto.sender),
    createdAt: dto.createdAt,
  );
}
