import 'dart:async';

import 'package:api_bindings/api_bindings.dart';
import 'package:api_bindings/json.dart';
import 'package:darq/darq.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:okidoki/main.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/domain/domain.dart' as domain;
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/iretry_policy.dart';
import 'package:signalr_netcore/web_supporting_http_client.dart';

part 'signalr_gateway.g.dart';

class SignalRRetryPolicy implements IRetryPolicy {
  late List<int?> _retryDelays;

  static const List<int?> kDefRetries = [
    0,
    1000,
    2000,
    4000,
    8000,
  ];

  new({List<int>? retryDelays}) {
    _retryDelays = retryDelays != null ? [...retryDelays, null] : kDefRetries;
  }

  @override
  int? nextRetryDelayInMilliseconds(RetryContext retryContext) {
    return _retryDelays.elementAtOrDefault(
      retryContext.previousRetryCount,
      defaultValue: _retryDelays.last,
    );
  }
}

@riverpod
class SignalRClient extends _$SignalRClient {
  @override
  Future<HubConnection> build() async {
    final token = await ref.watch(tokenStorageProvider.future);

    if (token == null) return future;

    final url = "${serverBaseUrl}hubs/realtime";
    final hubProtLogger = Logger("SignalR - hub");
    final transportProtLogger = Logger("SignalR - transport");

    final httpConnectionOptions = HttpConnectionOptions(
      httpClient: WebSupportingHttpClient(
        hubProtLogger,
        httpClientCreateCallback: (x) {},
      ),
      accessTokenFactory: () => Future.value(token.accessToken),
      logger: hubProtLogger,
      requestTimeout: 10000,
      logMessageContent: true,
    );

    final hubConnection = HubConnectionBuilder()
        .withUrl(url, options: httpConnectionOptions)
        .withAutomaticReconnect(reconnectPolicy: SignalRRetryPolicy())
        .configureLogging(transportProtLogger)
        .configureDeserializeCallback(deserializeCallback)
        .build();

    await hubConnection.start();

    return hubConnection;
  }

  T deserializeCallback<T>(dynamic value) {
    debugPrint("Deserializing value: $value to $T");
    return JsonConverter.fromJson(value);
  }

  Future<Object?>? typing(int channelId) => state.value?.invoke(
    "Typing",
    args: [
      channelId.toString(),
    ],
  );
}

class RealTimeEvent {
  const RealTimeEvent([this.content]);

  final String? content;

  // void handle() => switch(this)
  // {
  //   GatewayReady() => 1,
  //   MessageReceived(: final message) => 2,
  //   MessageDeleted(: final message) => 3,
  //   MessageEdited(: final message) => 3,
  //   RealTimeEvent() => 5,
  // };
}

class GatewayReady extends RealTimeEvent {}

class MessageReceived extends RealTimeEvent {
  const MessageReceived(this.message);
  final ChatMessageDto message;
}

class MessageEdited extends RealTimeEvent {
  const MessageEdited(this.message);
  final ChatMessageDto message;
}

class MessageDeleted extends RealTimeEvent {
  const MessageDeleted(this.id);
  final String id;
}

class const Typing({
  required final String channelId,
  required final String userId,
  required final DateTime dateTime,
}) extends RealTimeEvent {}

@riverpod
class SignalrGateway extends _$SignalrGateway {
  @override
  Stream<RealTimeEvent> build() async* {
    final connection = await ref.watch(signalRClientProvider.future);
    final controller = StreamController<RealTimeEvent>();

    ref.onDispose(() async {
      debugPrint("signalr gateway dispose");
      await controller.close();
      await connection.stop();
    });

    if (connection.state != .Connected) {
      await connection.start();
    }

    void messageReceived(ChatMessageDto message) {
      final msg = domain.ChatMessage.fromDto(message);
      ref.read(chatProvider(msg.chatId).notifier).updatedMessage(msg);

      controller.add(MessageReceived(message));
    }

    void messageEdited(ChatMessageDto message) {
      controller.add(MessageEdited(message));
    }

    void messageDeleted(String message) {
      controller.add(MessageDeleted(message));
    }

    void joinGuild(GuildProfileDto guildProfile) {
      ref
          .read(guildsProvider.notifier)
          .add(domain.Guild.profileFromDto(guildProfile));
    }

    void leaveGuild(String guildId) {
      ref.read(guildsProvider.notifier).remove(guildId.toInt());
    }

    void addedChannel(GuildChannelDto channelDto) {
      final channel = domain.GuildChannel.fromDto(channelDto);
      if (ref.exists(guildProvider(channel.guildId.toInt()))) {
        ref
            .read(guildProvider(channel.guildId.toInt()).notifier)
            .addChannel(channel);
      }
    }

    void removedChannel(String guildId, String channelId) {
      if (ref.exists(guildProvider(guildId.toInt()))) {
        ref
            .read(guildProvider(guildId.toInt()).notifier)
            .removeChannel(channelId.toInt());
      }
    }

    void userOnlineStateChanged(String userId, UserOnlineState userState) {
      // Implement the logic to handle user online state changes
    }

    // TODO implement friend related callbacks
    void friendRequest(UserProfileDto userProfile) {
      // final guildId = param.guildId!;
    }
    void friendAdded(UserProfileDto userProfile) {
      // final guildId = param.guildId!;
    }
    void friendRemoved(String userId) {
      // final guildId = param.guildId!;
    }

    void updatedGuildProfile(GuildProfileDto param) {
      final guild = domain.Guild.profileFromDto(param);
      ref.read(guildProvider(guild.id).notifier).updateProfile(guild);
    }

    void profileUpdated(UserProfileDto userProfile) {
      final userId = userProfile.id.toInt();
      final provider = userProfileProvider(userId);
      if (ref.exists(provider)) {
        ref.read(provider.notifier).set(userProfile);
      }
    }

    connection.onTyped<UserProfileDto>("FriendRequest", friendRequest);
    connection.onTyped<UserProfileDto>("FriendAdded", friendAdded);
    connection.onTyped<String>("FriendRemoved", friendRemoved);

    connection.onTyped<ChatMessageDto>("AddMessage", messageReceived);
    connection.onTyped<ChatMessageDto>("EditMessage", messageEdited);
    connection.onTyped<String>("DeleteMessage", messageDeleted);

    connection.onTyped<GuildProfileDto>("JoinGuild", joinGuild);
    connection.onTyped<String>("LeaveGuild", leaveGuild);

    connection.onTyped<GuildChannelDto>("AddedChannel", addedChannel);
    connection.onTyped2<String, String>("RemovedChannel", removedChannel);

    connection.onTyped<UserProfileDto>("UpdatedProfile", profileUpdated);
    connection.onTyped<GuildProfileDto>(
      "UpdatedGuildProfile",
      updatedGuildProfile,
    );

    connection.onTyped2<String, UserOnlineState>(
      "UserOnlineStateChangedAsync",
      userOnlineStateChanged,
    );

    connection.onTyped3<String, String, DateTime>(
      "Typing",
      (channelId, userId, dateTime) {
        ref
            .read(chatProvider(channelId.toInt()).notifier)
            .receiveTyping(userId.toInt(), dateTime);
        // controller.add(
        //   Typing(
        //     channelId: channelId,
        //     userId: userId,
        //     dateTime: dateTime,
        //   ),
        // );
      },
    );

    yield* controller.stream;
    Future.delayed(
      Duration(milliseconds: 500),
      () => controller.add(GatewayReady()),
    );
  }
}

abstract class SignalrInterface {
  void messageReceived(ChatMessageDto message);
  void messageEdited(ChatMessageDto message);
  void messageDeleted(String message);
  void joinGuild(GuildProfileDto guildProfile);
  void leaveGuild(String guildId);
  void addedChannel(GuildChannelDto channel);
  void removedChannel(String guildId, String channelId);
  void friendRequest(UserProfileDto userProfile);
  void friendAdded(UserProfileDto userProfile);
  void friendRemoved(String userId);
  void updatedGuildProfile(GuildProfileDto param);
  void profileUpdated(UserProfileDto userProfile);
}
