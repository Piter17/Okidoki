import 'dart:collection';

import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation.g.dart';

enum ViewType { empty, chat, friends }

class TrackedStack<T> {
  final Queue<T> queue;
  int index = 0;

  new([T? initialValue]) : queue = Queue.from([initialValue].nonNulls);

  void push(T value) {
    if (queue.length < index) {
      final items = queue.take(index);
      queue.clear();
      queue.addAll([...items, value]);
    } else {
      queue.addLast(value);
    }
    index = queue.length - 1;
  }

  void back() {
    if (index > 0) index--;
  }

  void forward() {
    if (index < queue.length - 1) index++;
  }

  void setIndex(int index) {
    this.index = index;
  }

  void clear() {
    queue.clear();
    index = 0;
  }

  T? get current => queue.elementAtOrNull(index);
  bool get canPop => false;
  bool get canForward => false;
}

class NavigateItem {
  final String? channelId;
  final String? guildId;
  final ViewType viewType;
  final Key key;

  new chat({
    required this.guildId,
    this.channelId,
  }) : viewType = ViewType.chat,
       key = ValueKey(channelId);

  new friends({
    this.channelId,
  }) : viewType = ViewType.friends,
       guildId = null,
       key = ValueKey(channelId);

  Widget? getNavigatorView(double? bottomSpace) => switch (viewType) {
    ViewType.empty => null,
    ViewType.chat => GuildNavigator(
      guildId: guildId,
      channelId: channelId,
      bottomSpace: bottomSpace,
    ),
    ViewType.friends => DmNavigator(bottomSpace: bottomSpace),
  };

  Widget getMainView() => switch (viewType) {
    ViewType.empty => EmptyPage(),
    ViewType.chat => channelId.mapOrElse(
      (x) => ChatPage(
        guildId: guildId,
        channelId: x,
        key: key,
      ),
      EmptyPage.new,
    ),
    ViewType.friends => FriendsPage(),
  };

  @override
  String toString() => switch (viewType) {
    ViewType.empty => "ViewType.empty",
    ViewType.chat => "ViewType.chat($guildId, $viewType)",
    ViewType.friends => "ViewType.friends($channelId)",
  };
}

class ChatNavigationState {
  final String? guildId;
  final String? channelId;
  final bool isFriendsSelected;
  final NavigateItem? current;
  final List<NavigateItem> history;
  final int index;

  const ChatNavigationState({
    this.guildId,
    this.channelId,
    this.isFriendsSelected = false,
    this.current,
    this.history = const [],
    this.index = 0,
  });

  factory ChatNavigationState.fromStack(TrackedStack<NavigateItem> stack) {
    final current = stack.current;
    return ChatNavigationState(
      guildId: current?.guildId,
      channelId: current?.channelId,
      isFriendsSelected: current?.viewType == ViewType.friends,
      current: current,
      history: stack.queue.toList(),
      index: stack.index,
    );
  }
}

@riverpod
class ChatNavigation extends _$ChatNavigation {
  late final TrackedStack<NavigateItem> _stack;

  @override
  ChatNavigationState build() {
    final guildId = ref.read(userSettingsProvider).lastGuild;
    _stack = TrackedStack(
      NavigateItem.chat(guildId: guildId),
    );
    return ChatNavigationState.fromStack(_stack);
  }

  void openGuild(String guildId) {
    ref.read(userSettingsProvider.notifier).setLastGuild(guildId);
    _stack.push(NavigateItem.chat(guildId: guildId));
    state = ChatNavigationState.fromStack(_stack);
  }

  void openChannel(String guildId, String channelId) {
    _stack.push(NavigateItem.chat(guildId: guildId, channelId: channelId));
    state = ChatNavigationState.fromStack(_stack);
  }

  void openFriends() {
    _stack.push(NavigateItem.friends());
    state = ChatNavigationState.fromStack(_stack);
  }

  void back() {
    _stack.back();
    state = ChatNavigationState.fromStack(_stack);
  }

  void forward() {
    _stack.forward();
    state = ChatNavigationState.fromStack(_stack);
  }

  void setIndex(int index) {
    _stack.setIndex(index);
    state = ChatNavigationState.fromStack(_stack);
  }

  void reset() {
    _stack.clear();
    state = ChatNavigationState.fromStack(_stack);
  }
}
