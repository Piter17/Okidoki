import 'package:auto_route/auto_route.dart';
import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';

@RoutePage()
class const GuildChatPage({
  super.key,
  @PathParam() required final int? channelId,
  @PathParam() required final int guildId,
}) extends StatefulHookConsumerWidget {
  @override
  ConsumerState<GuildChatPage> createState() => _GuildChatPageState();
}

class _GuildChatPageState extends ConsumerState<GuildChatPage> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(appSettingsProvider);
    final channelId = widget.channelId;
    final guildId = widget.guildId;
    if (channelId == null) {
      return const Center(
        child: Text("nic tu nie ma :o"),
      );
    }

    final guild = ref.watch(guildProvider(guildId));
    final channel = guild.value?.mapOrNull(
      asMember: (value) => value.channels!.singleWhere(
        (x) => x.id == channelId,
      ),
    );

    final users = ref.watch(guildUsersProvider(guildId));
    final messagesKey = ValueKey(channelId);

    return BaseMainScreen(
      topBar: ChatTopBar(
        channel,
        isUserListVisible: settings.isUserListVisible,
        setUserListVisible: ref
            .read(appSettingsProvider.notifier)
            .setUserListVisible,
      ),
      body: ChatMessageList(
        key: messagesKey,
        guild: guild.value,
        channelId: channelId,
        bottom: MessageTextField(
          channelId: channelId,
          guildId: guildId,
          hintText: channel != null
              ? context.s.chat_message_hint(channel.name)
              : context.s.chat_message_hint(TextGen.channelName()),
        ),
      ),
      right: settings.isUserListVisible
          ? ListView.builder(
              itemCount: users.value?.length ?? 0,
              itemBuilder: (context, index) {
                final user = users.value?[index];

                return user == null
                    ? UserTile.skeleton(key: ValueKey(index))
                    : UserTile(
                        key: ValueKey(user.id),
                        user: user,
                      );
              },
            )
          : null,
    );
  }
}

class ChatTopBar extends BaseTopBar {
  final GuildChannel? channel;
  final bool isUserListVisible;
  final void Function(bool) setUserListVisible;

  const ChatTopBar(
    this.channel, {
    super.key,
    required this.isUserListVisible,
    required this.setUserListVisible,
  });

  @override
  bool get isLoading => channel == null;

  @override
  Widget? get prefixIcon => Icon(Icons.tag);

  @override
  List<Widget>? get actions => [
    Icon(Icons.phone),
    IconButton(
      onPressed: () => setUserListVisible(!isUserListVisible),
      icon: Icon(Icons.pin),
    ),
  ];

  @override
  Widget? get title => ChatContextMenu(
    chatId: channel!.id,
    child: Text(channel?.name ?? TextGen.channelName()),
  );
}
