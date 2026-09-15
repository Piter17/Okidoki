import 'package:api_bindings/api_bindings.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

final createInvitationMutation = Mutation<GuildInvitationDto>();

class GuildInvitePopup extends HookConsumerWidget {
  final String guildId;

  const new({super.key, required this.guildId});

  static Future<void> open(BuildContext context, String guildId) {
    if (DeviceUtils.isPhone) {
      return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (context) => GuildInvitePopup(guildId: guildId),
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) => Dialog(
          constraints: BoxConstraints(
            minWidth: 150,
            maxWidth: 560,
          ),

          child: GuildInvitePopup(guildId: guildId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guild = ref.watch(guildProvider(guildId)).requireValue;
    final invitationState = ref.watch(createInvitationMutation);
    if (invitationState is MutationIdle) {
      Future(
        () => createInvitationMutation.run(ref, (tsx) async {
          return tsx.callApi(
            (f) => f.getGuildsApi().createInvitation(guildId: guildId),
          );
        }),
      );
    }

    return StyledContainer(
      contextStyle: .dark,
      child: Padding(
        padding: context.values.containerPadding,
        child: Column(
          mainAxisSize: .min,
          children: [
            DialogHeader(
              text: context.s.guild_invite_friends(guild.name),
              centerText: false,
            ),
            switch (invitationState) {
              MutationIdle<GuildInvitationDto>() => Text(
                context.s.chat_invitation_idle,
              ),
              MutationPending<GuildInvitationDto>() => Text(
                context.s.chat_invitation_pending,
              ),
              MutationError<GuildInvitationDto>() => Text(
                context.s.chat_invitation_error,
              ),
              MutationSuccess<GuildInvitationDto>(:final value) => _Invitation(
                value: value.code!,
              ),
            },
          ],
        ),
      ),
    );
  }
}

class _Invitation extends StatelessWidget {
  final String value;

  const new({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ClipboardHelpers.setText(value),
      child: StyledContainer(
        contextStyle: .primary,
        padding: context.values.containerPadding,
        decoration: BoxDecoration(
          borderRadius: context.values.border,
        ), //context.values.borderS),
        child: SelectionArea(child: Text(value)),
      ),
    );
  }
}
