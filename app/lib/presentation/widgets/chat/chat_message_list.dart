import 'dart:collection';

import 'package:api_bindings/api_bindings.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

typedef LoadPageFunc = Future<List<ChatMessageDto>> Function(
  String? pageId,
  bool next,
);

class ChatListNotification extends Notification {}

class ChatEditMessageNotification extends ChatListNotification {
  final String messageId;

  ChatEditMessageNotification(this.messageId);
}

class ChatMessageList extends ConsumerStatefulWidget {
  final LoadPageFunc loadPage;
  final GuildDto? guild;
  final Widget? bottom;

  const ChatMessageList({
    super.key,
    required this.loadPage,
    required this.guild,
    this.bottom,
  });

  @override
  ConsumerState<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends ConsumerState<ChatMessageList> {
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

    try {
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

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _fillViewportIfNeeded(),
      );
    } catch (error, stackTrace) {
      debugPrint('Failed to load chat messages: $error');
      debugPrintStack(stackTrace: stackTrace);
    } finally {
      if (loadOlder) {
        _isLoadingPrevious = false;
      } else {
        _isLoadingNext = false;
      }
    }
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
    var first = null;
    var last = null;
    final r = NotificationListener<ChatListNotification>(
      onNotification: (notification) {
        if (notification is ChatEditMessageNotification) {
          setState(() {
            _editingMessageId = notification.messageId;
          });
          return true;
        }

        return false;
      },
      child: false
          ? CustomScrollView(
              reverse: true,
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: first == null ? widget.bottom : null,
                ),
                // const SliverToBoxAdapter(child: Space()),
                SliverFillRemaining(
                  child: SliverList.builder(
                    itemCount: _items.length,

                    itemBuilder: (ctx, idx) {
                      first ??= idx;
                      last = idx;
                      print("first: $first, last: $last");

                      // print(
                      //   '* idx: $idx, item: ${_items.entries.elementAt(idx).value}',
                      // );
                      final item = _items.entries.elementAt(idx).value;

                      // final sender = ref.watch(
                      //   userProfileProvider(item.senderId),
                      // );

                      final previousMessage = _items.entries
                          .elementAtOrNull(idx + 1)
                          ?.value;

                      final compact =
                          previousMessage != null &&
                          item.senderId == previousMessage.senderId &&
                          item.sendTime!.difference(previousMessage.sendTime!) <
                              const Duration(minutes: 5);

                      return ChatMessage(
                        key: ValueKey(item.id),
                        messageId: item.id,
                        sendTime: item.sendTime!,
                        senderId: item.senderId,
                        compact: compact,
                        editMode: item.id == _editingMessageId,
                        guildId: widget.guild?.id,
                        content: item.content,
                      );
                    },
                  ),
                ),
                // if (_isLoadingPrevious)
                //   SliverList.builder(
                //     itemCount: 10,
                //     itemBuilder: (_, index) =>
                //         ChatMessage.skeleton(key: ValueKey(index)),
                //   ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    reverse: true,
                    controller: _scrollController,
                    slivers: [
                      // SliverToBoxAdapter()
                      // const SliverToBoxAdapter(child: Space()),
                      SliverList.builder(
                        itemCount: _items.length,

                        itemBuilder: (ctx, idx) {
                          first ??= idx;
                          last = idx;
                          print("first: $first, last: $last");

                          // print(
                          //   '* idx: $idx, item: ${_items.entries.elementAt(idx).value}',
                          // );
                          final item = _items.entries.elementAt(idx).value;

                          // final sender = ref.watch(
                          //   userProfileProvider(item.senderId),
                          // );

                          final previousMessage = _items.entries
                              .elementAtOrNull(idx + 1)
                              ?.value;

                          final compact =
                              previousMessage != null &&
                              item.senderId == previousMessage.senderId &&
                              item.sendTime!.difference(
                                    previousMessage.sendTime!,
                                  ) <
                                  const Duration(minutes: 5);

                          return ChatMessage(
                            key: ValueKey(item.id),
                            messageId: item.id,
                            sendTime: item.sendTime!,
                            senderId: item.senderId,
                            compact: compact,
                            editMode: item.id == _editingMessageId,
                            guildId: widget.guild?.id,
                            content: item.content,
                          );
                        },
                      ),
                      if (_isLoadingPrevious)
                        SliverList.builder(
                          itemCount: 10,
                          itemBuilder: (_, index) =>
                              ChatMessage.skeleton(key: ValueKey(index)),
                        ),
                    ],
                  ),
                ),
                ?widget.bottom,
              ],
            ),
    );
    print("first: $first, last: $last");
    return r;
  }
}
