import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/mutations/mutations/user/user_mutations.dart';
import 'package:riv/utils/utils.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider).requireValue;

    final changeImageMutation = useMemoized(
      UserMutations.getChangeProfilePicture,
    );

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          context.s.settings_profile,
          style: context.fonts.chatHeading2,
        ),
        ImagePicker(
          onChanged: (img) {
            if (img != null) {
              changeImageMutation.run(
                ref,
                UserMutations.changeProfilePicture(img),
              );
            }
          },
          initialImage: profile.profilePicture,
        ),
        TextEntry(
          text: Text(context.s.profile_display_name),
          value: profile.userName!,
        ),
        TextEntry(
          text: Text(context.s.profile_account_name),
          value: profile.nickname!,
        ),
        SwitchEntry(
          text: Text(context.s.profile_option_placeholder),
          subText: Text(
            TextGen.sentence(80, 120),
            maxLines: 10,
            overflow: .clip,
          ),
          value: false,
        ),
        SwitchEntry(
          text: Text(context.s.profile_option_placeholder),
          value: true,
        ),
        SwitchEntry(
          text: Text(context.s.profile_option_placeholder),
          value: false,
        ),
      ],
    );
  }
}
