import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart' show debugPrint, Key;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:okidoki/domain/chat/chat_message.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_messages.g.dart';
part 'chat_messages.freezed.dart';

@freezed
class const ChatMessagesState({
  required final bool isLoadingMore,
  required final bool hasMore,
  required final Map<int, DateTime> usersTyping,
  required final SplayTreeMap<int, ChatMessage> messages,
  final Object? error,
}) with _$ChatMessagesState {
  factory create() => ChatMessagesState(
    isLoadingMore: false,
    hasMore: true,
    usersTyping: {},
    messages: SplayTreeMap(
      (key1, key2) => key2.compareTo(key1),
    ),
  );

  ChatMessage? operator [](int index) =>
      messages[messages.keys.elementAtOrNull(index)];
}

@riverpod
class Chat extends _$Chat {
  @override
  ChatMessagesState build(int chatId) {
    Future.microtask(loadMore);
    return ChatMessagesState.create();
  }

  DateTime? _lastTypingSent;
  final bool hasMore = true;
  Timer? _typingTimer;

  void sendTyping() {
    if (_lastTypingSent == null ||
        _lastTypingSent!.timeSinceNow > Duration(seconds: 3)) {
      _lastTypingSent = DateTime.now();
      ref.read(signalRClientProvider.notifier).typing(chatId);
    }
  }

  void receiveTyping(int userId, DateTime dateTime) {
    final current = state;
    current.usersTyping[userId] = dateTime;

    _typingTimer?.cancel();
    _typingTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        state.usersTyping.removeWhere(
          (user, time) => time.timeSinceNow > Duration(seconds: 5),
        );
        ref.notifyListeners();
        if (state.usersTyping.isEmpty) {
          timer.cancel();
        }
      },
    );

    ref.notifyListeners();
  }

  Future<List<ChatMessage>> _loadOlderMessages({required int? beforeId}) async {
    final messages = await ref.callApi(
      (api, ct) => api.getChatApi().getMessages(
        guildChannelId: chatId.toString(),
        cursor: beforeId?.toString(),
        direction: .prev,
      ),
    );
    return messages.map(ChatMessage.fromDto).toList();
  }

  Future<void> loadMore() async {
    final current = state;

    debugPrint('loadMore Current state: $current');

    if (current.isLoadingMore || !current.hasMore) {
      return;
    }

    state = current.copyWith(isLoadingMore: true);

    debugPrint('loadMore2 Current state: $state');

    try {
      final oldestId = current.messages.lastKey();
      debugPrint('oldestId: $oldestId');
      final messages = await _loadOlderMessages(
        beforeId: oldestId,
      );

      state.messages.addAll({
        for (final message in messages) message.id: message,
      });

      debugPrint('messages loaded: ${messages.length}');
      state = current.copyWith(
        hasMore: messages.isNotEmpty,
        isLoadingMore: false,
      );
      ref.notifyListeners();
    } catch (e) {
      state = state.copyWith(error: e);
    }
  }

  void remove(int id) {
    state = state..messages.remove(id);
  }

  void updatedMessage(ChatMessage message) {
    state.messages[message.id] = message;
    ref.notifyListeners();
  }
}

@riverpod
class Message extends _$Message {
  @override
  ChatMessage build(int chatId, int messageId) {
    final messages = ref.watch(chatProvider(chatId));
    return messages.messages[messageId]!;
  }
}

@riverpod
class SkeletonMessage extends _$SkeletonMessage {
  static final _items = List.generate(
    10,
    (index) => ChatMessage(
      id: index,
      chatId: 0,
      senderId: 0,
      content: TextGen.sentence(3, 10),
      sent: DateTime.now(),
      modified: null,
    ),
  );

  @override
  ChatMessage build(Key key) {
    final item = key.hashCode % 10;
    return _items[item];
  }
}
