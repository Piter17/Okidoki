import 'package:api_bindings/api_bindings.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';

final createInvitationMutation = Mutation<GuildInvitationDto>();

class GuildInvitePopup extends HookConsumerWidget {
  final int guildId;

  const new({super.key, required this.guildId});

  static Future<void> open(BuildContext context, int guildId) {
    return showResponsivePopup(
      context: context,
      dialogConstraints: BoxConstraints(maxWidth: 420, maxHeight: 409),
      builder: (context) => GuildInvitePopup(guildId: guildId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guild = ref.watch(guildProvider(guildId)).requireValue;
    final invitationState = ref.watch(createInvitationMutation);
    if (invitationState is MutationIdle) {
      Future(
        () => createInvitationMutation.run(ref, (tsx) async {
          return tsx.callApi(
            (f) =>
                f.getGuildsApi().createInvitation(guildId: guildId.toString()),
          );
        }),
      );
    }

    final link = switch (invitationState) {
      MutationSuccess<GuildInvitationDto>(:final value) =>
        ReleaseConfig.getInviteUrl(value.code),
      _ => null,
    };

    createInvitationMutation.showPopupOnError(context, ref);

    return BaseDialog(
      centerText: false,
      title: context.s.guild_invite_server,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              guild.name,
              style: context.fonts.subtitle2,
              textAlign: TextAlign.start,
            ),
          ),
          Space(),
          _Invitation(
            value: link,
          ),
        ],
      ),
    );
  }
}

class _Invitation extends StatelessWidget {
  final String? value;

  const new({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.values.containerPaddingL,
      decoration: BoxDecoration(
        borderRadius: context.values.border,
        border: Border.all(
          color: context.appColors.info.outline,
        ),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          value == null
              ? CircularProgressIndicator()
              : SelectionArea(child: Text(value ?? " ")),
          Space(),
          Button(
            onPressed: value != null
                ? () => ClipboardHelpers.setText(value!)
                : null,
            child: Text(context.s.generic_copy),
          ),
        ],
      ),
    );
  }
}
