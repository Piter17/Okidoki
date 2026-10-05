import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/mutations/mutations/user/user_mutations.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider).requireValue;
    final user = ref.watch(currentUserProvider).requireValue;

    final changeImageMutation = useMemoized(
      UserMutations.getChangeProfilePicture,
    );

    return BaseSettingsPage.column(
      [
        TitleEntry(Text(context.s.settings_profile)),
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
          value: profile.nickname!,
        ),
        TextEntry(
          text: Text(context.s.profile_account_name),
          value: profile.userName,
        ),
        TextEntry(
          text: Text(context.s.profile_account_name),
          value: user?.email ?? "ustaw email",
        ),
        TextEntry(
          text: Text(context.s.profile_account_name),
          value: user?.id.toString() ?? "ustaw email",
        ),
      ],
    );
  }
}
