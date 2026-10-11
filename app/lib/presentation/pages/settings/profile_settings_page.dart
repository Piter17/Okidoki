import 'package:okidoki/mutations/mutations/user/user_mutations.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider).requireValue;
    final user = ref.watch(currentUserProvider).requireValue;

    final changeImageMutation = useMemoized(
      UserMutations.getChangeProfilePicture,
    );

    final hasEmail = user?.email != null;

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
          value: profile.nickname,
          readOnly: true,
        ),
        TextEntry(
          text: Text(context.s.profile_account_name),
          value: profile.userName,
          readOnly: true,
        ),
        TextEntry(
          text: Text(context.s.generic_email),
          value: user?.email ?? "ustaw email",
          // onTap: hasEmail ? null : () => AddCredentialsDialog.open(context),
          onTap: () => AddCredentialsDialog.open(context),
          readOnly: true,
        ),
        TextEntry(
          text: Text(context.s.generic_user_id),
          value: "${user?.id.toString()}",
          readOnly: true,
        ),
      ],
    );
  }
}
