import 'dart:collection';
import 'dart:ui';

import 'package:api_bindings/api_bindings.dart';
import 'package:okidoki/domain/domain.dart' as domain;
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

typedef LoadPageFunc = Future<List<ChatMessageDto>> Function(
  String? pageId,
  bool next,
);

class ChatListNotification extends Notification {}

class ChatEditMessageNotification extends ChatListNotification {
  final int messageId;

  ChatEditMessageNotification(this.messageId);
}

class ChatMessageList extends ConsumerStatefulWidget {
  final domain.Guild? guild;
  final int channelId;
  final Widget? bottom;

  const ChatMessageList({
    super.key,
    required this.channelId,
    required this.guild,
    this.bottom,
  });

  @override
  ConsumerState<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends ConsumerState<ChatMessageList> {
  final ScrollController _scrollController = ScrollController();
  ProviderSubscription<AsyncValue<RealTimeEvent>>? _signalrSubscription;

  int? _editingMessageId;

  static const double _edgeThreshold = 300;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    // _signalrSubscription = ref.listenManual<AsyncValue<RealTimeEvent>>(
    //   signalrGatewayProvider,
    //   (_, next) {
    //     next.when(
    //       data: (event) {
    //         if (!mounted) return;

    //         setState(() {
    //           switch (event) {
    //             case Typing(
    //               :final channelId,
    //               :final userId,
    //               :final dateTime,
    //             ):
    //               print(
    //                 "Typing event: channelId=$channelId, userId=$userId, dateTime=$dateTime",
    //               );
    //           }
    //         });
    //       },
    //       error: (_, _) {},
    //       loading: () {},
    //     );
    //   },
    // );
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
      ref.read(chatProvider(widget.channelId).notifier).loadMore();
    }

    if (maxScroll - pixels <= _edgeThreshold) {
      ref.read(chatProvider(widget.channelId).notifier).loadMore();
    }
  }

  void _fillViewportIfNeeded() {
    if (!mounted || !_scrollController.hasClients) return;

    if (_scrollController.position.maxScrollExtent <= 0) {
      ref.read(chatProvider(widget.channelId).notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chat = ref.watch(chatProvider(widget.channelId));

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
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              reverse: true,
              controller: _scrollController,
              slivers: [
                SliverList.builder(
                  itemCount: chat.messages.length,
                  itemBuilder: (context, index) {
                    final msg = chat[index]!;
                    final prev = chat[index + 1];

                    final compact =
                        prev != null &&
                        msg.senderId == prev.senderId &&
                        msg.sent.difference(prev.sent) <
                            const Duration(minutes: 5);

                    return UiMessage(
                      key: ValueKey(msg.id),
                      compact: compact,
                      editMode: false,
                      chatId: widget.channelId,
                      guildId: widget.guild?.id,
                      messageId: msg.id,
                    );

                    // return UiMessage(
                    //   compact: compact,
                    //   content: msg.content,
                    //   sendTime: msg.sent,
                    //   senderId: msg.senderId,
                    //   editMode: false,
                    //   guildId: widget.guild?.id,
                    //   modifiedTime: msg.modified,
                    //   key: ValueKey(id),
                    //   messageId: id,
                    // );
                  },
                ),
                if (chat.isLoadingMore)
                  SliverList.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) =>
                        UiMessage.skeleton(key: ValueKey(index)),
                  ),
              ],
            ),
          ),
          if (widget.bottom != null)
            Padding(
              padding: context.values.chatMessageEntryPadding,
              child: widget.bottom,
            ),
        ],
      ),
    );
    return r;
  }
}
