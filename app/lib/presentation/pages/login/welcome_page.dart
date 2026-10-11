import 'package:auto_route/auto_route.dart';
import 'package:okidoki/domain/domain.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

@RoutePage()
class const WelcomePage({super.key}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'Welcome to Okidoki!',
          style: context.fonts.largeTitle,
        ),
        Button(
          onPressed: () => context.navigateTo(LoginRoute()),
          child: Text('Login'),
        ),
        Button(
          buttonType: .secondary,
          onPressed: () => context.navigateTo(RegisterRoute()),
          child: Text('Register'),
        ),
      ],
    );
  }
}

@RoutePage()
class const InvitePage({
  super.key,
  @PathParam() required final String guildInvitationCode,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invite = ref.watch(guildInviteProvider(guildInvitationCode));
    return invite.map(
      data: (data) => buildInvitation(context, data.value),
      error: (error) => buildError(),
      loading: (loading) => CircularProgressIndicator(),
    );
  }

  Widget buildInvitation(BuildContext context, GuildInvitation data) {
    final inviterName = data.createdBy.hasNickname
        ? "${data.createdBy.nickname} (${data.createdBy.userName})"
        : data.createdBy.userName;
    return Column(
      children: [
        UserAvatar(
          id: data.createdBy.id,
          image: data.createdBy.profilePicture,
          userState: null,
          radius: 60,
        ),
        Text("$inviterName has invited you"),
        Row(
          children: [
            UserAvatar(
              id: data.guild.id,
              image: data.guild.image,
              radius: 40,
            ),
            Expanded(
              child: Text(
                data.guild.name,
                style: context.fonts.subtitle1,
                textAlign: .center,
              ),
            ),
          ],
        ),
        RegisterPage(
          guildInvitationCode: guildInvitationCode,
        ),
      ],
    );
  }

  Widget buildError() {
    return Text("Zaproszenie nie jest już dostępne.");
  }
}
