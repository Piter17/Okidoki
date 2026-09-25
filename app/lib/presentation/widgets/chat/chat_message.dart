import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:api_bindings/api_bindings.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

class ChatMessage extends HookConsumerWidget {
  final String? messageId;
  final String? senderId;
  final String? guildId;
  final bool compact;
  final bool editMode;
  final bool isSkeleton;

  final String content;
  final DateTime sendTime;
  final DateTime? modifiedTime;

  const ChatMessage({
    super.key,
    this.guildId,
    required this.messageId,
    required this.senderId,
    required this.compact,
    required this.content,
    required this.sendTime,
    this.modifiedTime,
    this.editMode = false,
  }) : isSkeleton = false;

  ChatMessage.skeleton({super.key, this.compact = false})
    : content = TextGen.message(),
      guildId = null,
      editMode = false,
      messageId = null,
      modifiedTime = null,
      sendTime = TextGen.date(),
      senderId = null,
      isSkeleton = true;

  bool get isUserLoading => senderId == null;

  Widget _userNick(BuildContext context, String? nickname) {
    return Text.rich(
      TextSpan(
        text: nickname,
        style: context.fonts.chatUser,
        children: [
          TextSpan(text: '  '),
          TextSpan(
            text: context.formatter.formatMessageTime(sendTime.toLocal()),
            style: context.fonts.chatDate,
          ),
        ],
      ),
    ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
  }

  Widget _userAvatar(String? profilePicture) {
    return UserAvatar(
      image: profilePicture,
    ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
  }

  Widget _sendDate(BuildContext context, bool hovered) {
    return SizedBox(
      height: 16,
      child: hovered.thenValue(
        Text(
          context.formatter.formatTime(sendTime.toLocal()),
          style: context.fonts.chatDate,
        ),
      ),
    ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markdown = ThemeValues.of(context).markdownStyleSheet;
    final hovered = useState(false);

    final user = senderId == null
        ? null
        : ref.watch(userProfileProvider(senderId!));

    final profilePicture = user?.value?.profilePicture;
    final nickname = user?.value?.nickname ?? TextGen.nick();
    // final nickname = useMemoized(() => user?.nickname ?? TextGen.nick());
    // final profilePicture = useMemoized(() => user?.profilePicture);
    // final nickname = useMemoized(() => user?.nickname ?? TextGen.nick());

    // final colorSet = editMode
    //     ? context.palette.getHover(isHover)
    //     : context.palette.background;

    return Skeletonizer(
      enabled: isSkeleton,
      child: Container(
        decoration: BoxDecoration(
          color: context.palette.getHover(hovered.value),
          // border: colorSet == context.palette.background
          //     ? null
          //     : Border(left: BorderSide(color: colorSet.background, width: 4)),
        ),
        child: InkWell(
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
                    ? _sendDate(context, hovered.value)
                    : _userAvatar(profilePicture).wrapIf(
                        senderId != null && guildId != null,
                        (x) => GuildUserContextMenu(
                          userId: senderId!,
                          guildId: guildId!,
                          child: x,
                        ),
                      ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (compact == false) _userNick(context, nickname),
                    // Text(content),
                    MarkdownBody(
                      data: content,
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
                    if (modifiedTime != null)
                      Text(
                        context.s.chat_messageModified(
                          context.formatter.formatMessageTime(
                            modifiedTime!,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // .wrapIf(
        //   editMode,
        //   (c) => ColoredBox(
        //     color: context.colors.danger.color,
        //     child: c,
        //   ),
        // )
        // .wrapIf(
        //   message != null,
        //   (x) => MessageContextMenu(message: message!, child: x),
        // ),
      ),
    );
  }
}

// import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
// import 'package:riv/presentation/presentation.dart';
// import 'package:markdown/markdown.dart' as md;
// import 'package:api_bindings/api_bindings.dart';
// import 'package:riv/utils/utils.dart';

// class ChatMessage extends HookWidget {
//   final ChatMessageDto? message;
//   final UserProfileDto? user;
//   final GuildDto? guild;
//   final bool compact;
//   final bool editMode;
//   final bool isSkeleton;

//   final String content;
//   final DateTime sendTime;
//   final DateTime? modifiedTime;

//   ChatMessage({
//     super.key,
//     this.guild,
//     required this.message,
//     required this.user,
//     required this.compact,
//     this.editMode = false,
//   }) : content = message!.content,

//        modifiedTime = message.modifiedTime,
//        sendTime = message.sendTime!,
//        isSkeleton = false;

//   ChatMessage.skeleton({super.key, this.compact = false})
//     : content = TextGen.message(),
//       guild = null,
//       editMode = false,
//       message = null,
//       modifiedTime = null,
//       sendTime = TextGen.date(),
//       user = null,
//       isSkeleton = true;

//   bool get isUserLoading => user == null;

//   Widget _userNick(BuildContext context, String? nickname) {
//     return Text.rich(
//       TextSpan(
//         text: nickname,
//         style: context.fonts.chatUser,
//         children: [
//           TextSpan(text: '  '),
//           TextSpan(
//             text: context.formatter.formatMessageTime(sendTime.toLocal()),
//             style: context.fonts.chatDate,
//           ),
//         ],
//       ),
//     ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
//   }

//   Widget _userAvatar(String? profilePicture) {
//     return UserAvatar(
//       image: profilePicture,
//     ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
//   }

//   Widget _sendDate(BuildContext context, bool hovered) {
//     return SizedBox(
//       height: 16,
//       child: hovered.thenValue(
//         Text(
//           context.formatter.formatTime(sendTime.toLocal()),
//           style: context.fonts.chatDate,
//         ),
//       ),
//     ).wrapIf(isUserLoading, (c) => Skeletonizer(child: c));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final markdown = ThemeValues.of(context).markdownStyleSheet;
//     final hovered = useState(false);

//     final profilePicture = useMemoized(() => user?.profilePicture);
//     final nickname = useMemoized(() => user?.nickname ?? TextGen.nick());

//     // final colorSet = editMode
//     //     ? context.palette.getHover(isHover)
//     //     : context.palette.background;

//     return Skeletonizer(
//       enabled: isSkeleton,
//       child: Container(
//         decoration: BoxDecoration(
//           color: context.palette.getHover(hovered.value),
//           // border: colorSet == context.palette.background
//           //     ? null
//           //     : Border(left: BorderSide(color: colorSet.background, width: 4)),
//         ),
//         child: InkWell(
//           onTap: isSkeleton ? null : () {},
//           onHover: hovered.set,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             textBaseline: TextBaseline.alphabetic,
//             children: [
//               Space(space: context.values.chatPadding),
//               SizedBox(
//                 width: 50,
//                 child: compact
//                     ? _sendDate(context, hovered.value)
//                     : _userAvatar(profilePicture).wrapIf(
//                         user != null && guild != null,
//                         (x) => GuildUserContextMenu(
//                           user: user!,
//                           guild: guild!,
//                           child: x,
//                         ),
//                       ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (compact == false) _userNick(context, nickname),
//                     // Text(content),
//                     MarkdownBody(
//                       data: content,
//                       selectable: false,
//                       shrinkWrap: true,
//                       softLineBreak: true,
//                       styleSheet: markdown,
//                       extensionSet: md.ExtensionSet(
//                         md.ExtensionSet.gitHubFlavored.blockSyntaxes,
//                         <md.InlineSyntax>[
//                           md.EmojiSyntax(),
//                           ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
//                         ],
//                       ),
//                     ),
//                     if (modifiedTime != null)
//                       Text(
//                         context.s.chat_messageModified(
//                           context.formatter.formatMessageTime(
//                             modifiedTime!,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // .wrapIf(
//         //   editMode,
//         //   (c) => ColoredBox(
//         //     color: context.colors.danger.color,
//         //     child: c,
//         //   ),
//         // )
//         // .wrapIf(
//         //   message != null,
//         //   (x) => MessageContextMenu(message: message!, child: x),
//         // ),
//       ),
//     );
//   }
// }
