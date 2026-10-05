import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';

class UiMessage extends HookConsumerWidget {
  final int? messageId;
  final int? guildId;
  final int? chatId;
  final bool compact;
  final bool? editMode;
  final bool isSkeleton;

  const UiMessage({
    super.key,
    required this.messageId,
    required this.guildId,
    required this.chatId,
    required this.compact,
    this.editMode = false,
  }) : isSkeleton = false;

  const UiMessage.skeleton({super.key, this.compact = false})
    : guildId = null,
      editMode = false,
      chatId = null,
      messageId = null,
      isSkeleton = true;

  Widget _userNick(
    BuildContext context,
    bool isUserLoading,
    String? nickname,
    DateTime sendTime,
  ) {
    return Text.rich(
      TextSpan(
        text: nickname,
        style: context.fonts.chatUser,
        children: [
          TextSpan(text: '  '),
          TextSpan(
            text: context.formatter.formatMessageTime(sendTime),
            style: context.fonts.chatDate,
          ),
        ],
      ),
    ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
  }

  Widget _userAvatar(bool isUserLoading, String? profilePicture) {
    return UserAvatar(
      image: profilePicture,
    ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
  }

  Widget _sendDate(
    BuildContext context,
    bool isUserLoading,
    bool hovered,
    DateTime sendTime,
  ) {
    return SizedBox(
      height: 16,
      child: hovered.thenValue(
        Text(
          context.formatter.formatTime(sendTime),
          style: context.fonts.chatDate,
        ),
      ),
    ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markdown = ThemeValues.of(context).markdownStyleSheet;
    final hovered = useState(false);

    final message = isSkeleton
        ? ref.watch(skeletonMessageProvider(key!))
        : ref.watch(messageProvider(chatId!, messageId!));

    final senderId = message.senderId;

    final userProv = senderId.isNullOrZero
        ? ref.watch(skeletonUserProfileProvider(key!))
        : ref.watch(userProfileProvider(senderId));

    final isUserLoading = userProv.isLoading;

    final user =
        userProv.value ?? ref.watch(skeletonUserProfileProvider(key!)).value;

    return Skeletonizer(
      enabled: isSkeleton,
      child: Container(
        decoration: BoxDecoration(
          color: context.palette.getHover(hovered.value),
          // border: colorSet == context.palette.background
          //     ? null
          //     : Border(left: BorderSide(color: colorSet.background, width: 4)),
        ),
        child:
            InkWell(
              onTap: isSkeleton ? null : () {},
              onHover: hovered.set,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Space(space: context.values.chatPadding),
                  SizedBox(
                    width: 50,
                    child: compact
                        ? _sendDate(
                            context,
                            isUserLoading,
                            hovered.value,
                            message.sent,
                          )
                        : _userAvatar(
                            isUserLoading,
                            user?.profilePicture,
                          ).wrapIf(
                            senderId.isNotNullOrZero && guildId != null,
                            (x) => GuildUserContextMenu(
                              userId: senderId,
                              guildId: guildId!,
                              child: x,
                            ),
                          ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (compact == false)
                          _userNick(
                            context,
                            isUserLoading,
                            user?.nickname,
                            message.sent,
                          ),
                        MarkdownBody(
                          data: message.content,
                          selectable: false,
                          shrinkWrap: true,
                          softLineBreak: true,
                          styleSheet: markdown,
                          extensionSet: md.ExtensionSet(
                            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
                            <md.InlineSyntax>[
                              md.EmojiSyntax(),
                              ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
                            ],
                          ),
                        ),
                        if (message.modified != null)
                          Text(
                            context.s.chat_messageModified(
                              context.formatter.formatMessageTime(
                                message.modified!,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            // .wrapIf(
            //   editMode,
            //   (c) => ColoredBox(
            //     color: context.colors.danger.color,
            //     child: c,
            //   ),
            // )
            .wrapIf(
              isSkeleton == false,
              (x) => MessageContextMenu(message: message, child: x),
            ),
      ),
    );
  }
}
