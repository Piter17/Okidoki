import 'dart:collection';

import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:api_bindings/api_bindings.dart';

typedef LoadPageFunc = Future<List<ChatMessageDto>> Function(
  String? pageId,
  bool next,
);

// @RoutePage()
class const ChatPage({
  super.key,
  required final String channelId,
  required final String? guildId,
}) extends StatefulHookConsumerWidget {
  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final guildId = widget.guildId;
    if (guildId == null) {
      return const SizedBox.shrink();
    }

    return ChatView(
      channelId: widget.channelId,
      guildId: guildId,
      loadPage: (pageId, next) => ref.watch(
        messagesProvider(
          widget.channelId,
          pageId,
          next ? QueryDirection.next : QueryDirection.prev,
        ).future,
      ),
    );
  }
}

class ChatTopBar extends BaseTopBar {
  final GuildChannelDto channel;

  const ChatTopBar(this.channel, {super.key});

  @override
  Widget? get prefixIcon => Icon(Icons.tag);

  @override
  List<Widget>? get actions => [Icon(Icons.phone), Icon(Icons.pin)];

  @override
  Widget? get title => Text(channel.name);
}

class ChatListNotification extends Notification {}

class ChatEditMessageNotification extends ChatListNotification {
  final String messageId;
  ChatEditMessageNotification(this.messageId);
}

class const ChatView({
  super.key,
  required final LoadPageFunc loadPage,
  required final String channelId,
  required final String guildId,
}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final ScrollController _scrollController = ScrollController();
  ProviderSubscription<AsyncValue<RealTimeEvent>>? _signalrSubscription;

  final _items = SplayTreeMap<String, ChatMessageDto>(
    (key1, key2) => key2.compareTo(key1),
  );

  bool _isLoadingPrevious = false;
  bool _isLoadingNext = false;
  bool _hasOlder = true;
  bool _hasNewer = true;

  String? _oldestLoadedMessageId;
  String? _newestLoadedMessageId;
  String? _editingMessageId;

  static const double _edgeThreshold = 300;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    _signalrSubscription = ref.listenManual<AsyncValue<RealTimeEvent>>(
      signalrGatewayProvider,
      (_, next) {
        next.when(
          data: (event) {
            if (!mounted) return;

            setState(() {
              switch (event) {
                case MessageReceived(:final message):
                  _items.putIfAbsent(message.id, () => message);

                case MessageEdited(:final message):
                  _items.update(
                    message.id,
                    (_) => message,
                    ifAbsent: () => message,
                  );

                case MessageDeleted(:final id):
                  _items.remove(id);

                case RealTimeEvent():
                  break;
              }
            });
          },
          error: (_, _) {},
          loading: () {},
        );
      },
    );

    _loadPreviousPage();
  }

  @override
  void dispose() {
    _signalrSubscription?.close();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final pixels = position.pixels;
    final maxScroll = position.maxScrollExtent;

    if (pixels <= _edgeThreshold) {
      _loadPreviousPage();
    }

    if (maxScroll - pixels <= _edgeThreshold) {
      _loadNextPage();
    }
  }

  Future<void> _loadPreviousPage() async {
    await _loadMessagesPage(loadOlder: true);
  }

  Future<void> _loadNextPage() async {
    await _loadMessagesPage(loadOlder: false);
  }

  Future<void> _loadMessagesPage({required bool loadOlder}) async {
    final boundaryMessageId = loadOlder
        ? _oldestLoadedMessageId
        : _newestLoadedMessageId;
    final isLoading = loadOlder ? _isLoadingPrevious : _isLoadingNext;
    final hasMore = loadOlder ? _hasOlder : _hasNewer;

    if (isLoading || !hasMore) return;

    if (loadOlder) {
      _isLoadingPrevious = true;
    } else {
      _isLoadingNext = true;
    }

    final messages = await widget.loadPage(boundaryMessageId, !loadOlder);

    if (!mounted) return;

    setState(() {
      if (messages.isNotEmpty) {
        _items.addAll({for (final message in messages) message.id: message});

        final oldestLoadedMessageId = _items.lastKey();
        final newestLoadedMessageId = _items.firstKey();

        if (loadOlder) {
          _oldestLoadedMessageId = oldestLoadedMessageId;
          _newestLoadedMessageId ??= newestLoadedMessageId;
        } else {
          _newestLoadedMessageId = newestLoadedMessageId;
          _oldestLoadedMessageId ??= oldestLoadedMessageId;
        }
      }

      if (loadOlder) {
        _hasOlder = messages.isNotEmpty;
      } else {
        _hasNewer = messages.isNotEmpty;
      }
    });

    if (loadOlder) {
      _isLoadingPrevious = false;
    } else {
      _isLoadingNext = false;
    }

    // No scrollbar yet to trigger _onScroll, so keep fetching until the viewport is filled.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _fillViewportIfNeeded(),
    );
  }

  void _fillViewportIfNeeded() {
    if (!mounted || !_scrollController.hasClients) return;

    if (_scrollController.position.maxScrollExtent <= 0) {
      if (_hasOlder) _loadPreviousPage();
      if (_hasNewer) _loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final guild = ref.watch(guildProvider(widget.guildId));
    final channel = guild.requireValue.channels!.singleWhere(
      (x) => x.id == widget.channelId,
    );

    return BaseMainScreen(
      topBar: ChatTopBar(channel),
      body: NotificationListener<ChatListNotification>(
        onNotification: (notification) {
          if (notification is ChatEditMessageNotification) {
            setState(() {
              _editingMessageId = notification.messageId;
            });
            return true;
          }

          return false;
        },
        child: CustomScrollView(
          reverse: true,
          controller: _scrollController,
          slivers: [
            const SliverToBoxAdapter(child: Space()),
            SliverList.builder(
              itemCount: _items.length,
              itemBuilder: (ctx, idx) {
                final item = _items.entries.elementAt(idx).value;

                return Consumer(
                  builder: (context, ref, child) {
                    final sender = ref.watch(
                      userProfileProvider(item.senderId),
                    );

                    final previousMessage = _items.entries
                        .elementAtOrNull(idx + 1)
                        ?.value;

                    final compact =
                        previousMessage != null &&
                        item.senderId == previousMessage.senderId &&
                        item.sendTime!.difference(previousMessage.sendTime!) <
                            const Duration(minutes: 5);

                    return ChatMessage(
                      message: item,
                      user: sender,
                      compact: compact,
                      editMode: item.id == _editingMessageId,
                      guild: guild.requireValue,
                    );
                  },
                );
              },
            ),
            if (_isLoadingPrevious)
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (_, _) => ChatMessage.skeleton(),
              ),
          ],
        ),
      ),
      bottom: Padding(
        padding: context.values.chatMessageEntryPadding,
        child: MessageEntry(
          channelId: widget.channelId,
          hintText: context.s.chat_message_hint(channel.name),
        ),
      ),
    );
  }
}
