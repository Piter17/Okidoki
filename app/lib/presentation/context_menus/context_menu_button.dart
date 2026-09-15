import 'package:api_bindings/api_bindings.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:riv/presentation/presentation.dart' hide ChatMessage;
import 'package:riv/providers/providers.dart';
import 'package:riv/mutations/mutations.dart';
import 'package:riv/utils/utils.dart';

abstract class ContextMenuButton<TMenu> extends HookConsumerWidget {
  final Widget child;

  const ContextMenuButton({
    super.key,
    required this.child,
    this.onItemSelected,
  });

  ContextMenu<TMenu> getMenu(BuildContext context, WidgetRef ref);
  bool get leftButtonOpensMenu => false;
  final ValueChanged<TMenu?>? onItemSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContextMenuRegion<TMenu>(
      onItemSelected: onItemSelected,
      contextMenu: getMenu(context, ref),
      builder: (context, contextMenu, pointerPosition, showMenu, child) {
        return InkResponse(
          onTap: () =>
              debugPrint("asdfdsafsdf"), // () => showMenu(pointerPosition),
          child: child!,
        );
      },
      child: child,
    );
  }
}

class GuildIconContextMenu extends ContextMenuButton {
  const GuildIconContextMenu({
    super.key,
    required super.child,
    required this.guild,
  });

  final GuildProfileDto guild;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    return ContextMenu(
      entries: [
        MenuItem(
          onSelected: (value) {
            AddChannelDialog.open(context, guild.id);
          },
          label: Text(context.s.guild_add_channel),
        ),
        MenuItem(
          onSelected: (value) => ClipboardHelpers.setText(guild.id),
          label: Text(context.s.generic_copy_id),
        ),
      ],
    );
  }
}

class ChannelEntryIconContextMenu extends ContextMenuButton {
  const ChannelEntryIconContextMenu({
    super.key,
    required super.child,
    required this.channel,
  });

  final GuildChannelDto channel;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    final remove = useMemoized(GuildMutations.getRemoveChannel);
    return ContextMenu(
      entries: [
        MenuItem(
          onSelected: (value) {
            remove.run(
              ref,
              GuildMutations.removeChannelCb(
                guildId: channel.guildId,
                channelId: channel.id,
              ),
            );
          },
          label: Text(context.s.guild_remove_channel),
        ),
        MenuItem(
          onSelected: (value) =>
              ClipboardHelpers.setText(channel.id.toString()),
          label: Text(context.s.generic_copy_id),
        ),
      ],
    );
  }
}

class MessageContextMenu extends ContextMenuButton {
  const MessageContextMenu({
    super.key,
    required this.message,
    required super.child,
  });

  final ChatMessageDto message;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider).requireValue;
    final deleteMutation = useMemoized(ChatMutations.getDeleteMessage);
    return ContextMenu(
      entries: [
        MenuItem(
          onSelected: (value) {
            ChatEditMessageNotification(message.id).dispatch(context);
          },
          label: Text(context.s.generic_edit),
        ),
        if (message.senderId == user!.userId)
          MenuItem(
            onSelected: (value) {
              deleteMutation.run(
                ref,
                ChatMutations.deleteMessageCb(messageId: message.id),
              );
            },
            label: Text(context.s.generic_delete),
          ),
        MenuItem(
          onSelected: (value) =>
              ClipboardHelpers.setText(message.id.toString()),
          label: Text(context.s.generic_copy_id),
        ),
      ],
    );
  }
}

class GuildHeaderContextMenu extends ContextMenuButton {
  const GuildHeaderContextMenu({
    super.key,
    required super.child,
    required this.guild,
  });

  final GuildDto guild;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    return ContextMenu(
      entries: [
        MenuItem(
          onSelected: (value) {
            GuildInvitePopup.open(context, guild.id);
          },
          label: Text(context.s.guild_invite_friends(guild.name)),
        ),
        MenuItem(
          label: Text(context.s.guild_add_channel),
          onSelected: (value) {
            AddChannelDialog.open(context, guild.id);
          },
        ),
        MenuItem(
          label: Text(context.s.guild_settings),
          onSelected: (value) => GuildSettingsPage.open(context, guild.id),
        ),
        MenuItem(
          label: Text(context.s.generic_copy_id),
          onSelected: (value) {
            ClipboardHelpers.setText(guild.id);
          },
        ),
      ],
    );
  }
}

class GuildUserContextMenu extends ContextMenuButton {
  const GuildUserContextMenu({
    super.key,
    required super.child,
    required this.guild,
    required this.user,
  });

  final GuildDto guild;
  final UserProfileDto user;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    final sendInvite = useMemoized(FriendMutations.getSendInviteById);
    return ContextMenu(
      entries: [
        MenuItem(
          onSelected: (value) {
            AddChannelDialog.open(context, guild.id);
          },
          label: Text(context.s.guild_profile),
        ),
        MenuItem(
          label: Text(context.s.guild_private_message),
          onSelected: (value) {},
        ),
        MenuItem(
          label: Text(context.s.guild_invite_server),
          onSelected: (value) {},
        ),
        MenuItem(
          label: Text(context.s.guild_invite_friend),
          onSelected: (value) => sendInvite.run(
            ref,
            FriendMutations.sendInviteByIdCb(user.userId),
          ),
        ),
        MenuItem(
          label: Text(context.s.generic_copy_id),
          onSelected: (value) {
            ClipboardHelpers.setText(guild.id.toString());
          },
        ),
      ],
    );
  }
}

// class SelectColorMenu<T> extends ContextMenuButton {
//   const new({
//     super.key,
//     required super.child,
//     required this.possibleValues,
//     required this.value,
//   });

//   final Map<T, Widget Function(BuildContext)> possibleValues;
//   final T? value;

//   @override
//   ValueChanged<dynamic>? get onItemSelected => (value) {};

//   @override
//   ContextMenu getMenu(BuildContext context, WidgetRef ref) {
//     return ContextMenu(
//       entries: possibleValues.entries.map(
//         (x) => MenuItem(
//             label: Text(""),
//             icon: Icon(Icons.radio_button_checked),
//         ),
//       ).toList(),
//     );
//   }
// }
