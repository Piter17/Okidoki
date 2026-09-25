import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:api_bindings/api_bindings.dart';
import 'package:riv/utils/skeleton_text_generator.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class const GuildChatPage({
  super.key,
  @PathParam() required final String? channelId,
  @PathParam() required final String guildId,
}) extends StatefulHookConsumerWidget {
  @override
  ConsumerState<GuildChatPage> createState() => _GuildChatPageState();
}

class _GuildChatPageState extends ConsumerState<GuildChatPage> {
  Future<List<ChatMessageDto>> _loadMessagesPage(String? pageId, bool next) {
    final channelId = widget.channelId;
    if (channelId == null) return Future.value([]);

    return ref.read(
      messagesProvider(
        channelId,
        pageId,
        next ? QueryDirection.next : QueryDirection.prev,
      ).future,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isUserListVisible = useState(false);
    final channelId = widget.channelId;
    final guildId = widget.guildId;
    if (channelId == null) {
      return const Center(
        child: Text("nic tu nie ma :o"),
      );
    }

    final guild = ref.watch(guildProvider(guildId));
    final channel = guild.value?.channels!.singleWhere(
      (x) => x.id == channelId,
    );

    final messagesKey = ValueKey(channelId);

    return BaseMainScreen(
      topBar: ChatTopBar(
        channel,
        isUserListVisible: isUserListVisible.value,
        onToggleUserList: isUserListVisible.toggle,
      ),
      body: ChatMessageList(
        key: messagesKey,
        guild: guild.value,
        loadPage: _loadMessagesPage,
        bottom: Padding(
          padding: context.values.chatMessageEntryPadding,
          child: MessageEntry(
            channelId: channelId,
            hintText: channel != null
                ? context.s.chat_message_hint(channel.name)
                : context.s.chat_message_hint(TextGen.channelName()),
          ),
        ),
      ),
      right: isUserListVisible.value
          ? ListView(
              children: [
                Text("Channel Info"),
              ],
            )
          : null,
    );
  }
}

class ChatTopBar extends BaseTopBar {
  final GuildChannelDto? channel;
  final bool isUserListVisible;
  final VoidCallback? onToggleUserList;

  const ChatTopBar(
    this.channel, {
    super.key,
    required this.isUserListVisible,
    this.onToggleUserList,
  });

  @override
  bool get isLoading => channel == null;

  @override
  Widget? get prefixIcon => Icon(Icons.tag);

  @override
  List<Widget>? get actions => [
    Icon(Icons.phone),
    IconButton(onPressed: onToggleUserList, icon: Icon(Icons.pin)),
  ];

  @override
  Widget? get title => Text(channel?.name ?? TextGen.channelName());
}

// class const ChatView({
//   super.key,
//   required final LoadPageFunc loadPage,
//   required final String channelId,
//   required final String guildId,
// }) extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final guild = ref.watch(guildProvider(guildId));
//     final channel = guild.value?.channels!.singleWhere(
//       (x) => x.id == channelId,
//     );

//     return
//   }
// }
