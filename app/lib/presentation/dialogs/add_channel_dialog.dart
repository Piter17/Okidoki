import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/mutations/mutations/guild/guild_mutations.dart';
import 'package:riv/utils/device_utilis.dart';

class AddChannelDialog extends HookConsumerWidget {
  const AddChannelDialog({super.key, required this.guildId});

  final String guildId;

  static Future<void> open(BuildContext context, String guildId) {
    if (DeviceUtils.isPhone) {
      return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (context) => AddChannelDialog(guildId: guildId),
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) => Dialog(
          constraints: BoxConstraints(
            maxWidth: 560,
          ),

          child: AddChannelDialog(guildId: guildId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelNameController = useTextEditingController();
    final mutation = GuildMutations.getCreateChannel();

    return Padding(
      padding: context.values.containerPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogHeader(
            text: "Utwórz kanał",
          ),
          TextFormField(
            controller: channelNameController,
          ),
          Button(
            onPressed: mutation is MutationPending
                ? null
                : () => mutation
                      .run(
                        ref,
                        GuildMutations.createChannelCb(
                          guildId: guildId,
                          name: channelNameController.text,
                        ),
                      )
                      .then((x) {
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }),
            buttonType: ButtonType.secondary,
            child: Text(context.s.guild_add_channel),
          ),
        ],
      ),
    );
  }
}
