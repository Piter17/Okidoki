import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:okidoki/presentation/presentation.dart' hide UiMessage;
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/mutations/mutations.dart';
import 'package:okidoki/utils/utils.dart';
import 'package:okidoki/domain/domain.dart' as domain;

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

  final domain.Guild guild;

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
          onSelected: (value) => ClipboardHelpers.setText(guild.id.toString()),
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

  final domain.GuildChannel channel;

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

  final domain.ChatMessage message;

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
        if (message.senderId == user!.id)
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

  final domain.Guild guild;

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
            ClipboardHelpers.setText(guild.id.toString());
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
    required this.guildId,
    required this.userId,
  });

  final int guildId;
  final int userId;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    final sendInvite = useMemoized(FriendMutations.getSendInviteById);
    return ContextMenu(
      entries: [
        MenuItem(
          onSelected: (value) {
            AddChannelDialog.open(context, guildId);
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
            FriendMutations.sendInviteByIdCb(userId),
          ),
        ),
        MenuItem(
          label: Text(context.s.generic_copy_id),
          onSelected: (value) {
            ClipboardHelpers.setText(guildId.toString());
          },
        ),
      ],
    );
  }
}

class ChatContextMenu extends ContextMenuButton {
  const ChatContextMenu({
    super.key,
    required super.child,
    required this.chatId,
  });

  final int chatId;

  @override
  ContextMenu getMenu(BuildContext context, WidgetRef ref) {
    return ContextMenu(
      entries: [
        MenuItem(
          label: Text(context.s.debug_reload),
          onSelected: (value) => ref.invalidate(chatProvider(chatId)),
        ),
        MenuItem(
          label: Text(context.s.generic_copy_id),
          onSelected: (value) {
            ClipboardHelpers.setText(chatId.toString());
          },
        ),
      ],
    );
  }
}
