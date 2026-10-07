import 'package:auto_route/annotations.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

class const WelcomePage({
  super.key,
  required final VoidCallback goToRegister,
  required final VoidCallback goToLogin,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}

class const InvitePagea({
  super.key,
  required final String guildInvitationCode,
}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invite = ref.watch(guildInviteProvider(guildInvitationCode));
    return Column(
      children: [
        Text('Invite Code: $guildInvitationCode'),
        ...invite.mapOrNull(
              data: (d) => [
                Text('Invite Expiration: ${d.value.id}'),
                Text('Invite Status: ${d.value.guild.name}'),
                Text('Invite Status: ${d.value.guild.image}'),
                Text('Invite Guild: ${d.value.createdBy?.nickname}'),
                Text('Invite Guild: ${d.value.createdBy?.userName}'),
                Text('Invite Guild: ${d.value.createdBy?.profilePicture}'),
              ],
            ) ??
            [],
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
    return Column(
      children: [
        Text('Invite Code: $guildInvitationCode'),
        ...invite.mapOrNull(
              data: (d) => [
                Text('Invite Expiration: ${d.value.id}'),
                Text('Invite Status: ${d.value.guild.name}'),
                Text('Invite Status: ${d.value.guild.image}'),
                Text('Invite Guild: ${d.value.createdBy?.nickname}'),
                Text('Invite Guild: ${d.value.createdBy?.userName}'),
                Text('Invite Guild: ${d.value.createdBy?.profilePicture}'),
              ],
            ) ??
            [],
      ],
    );
  }
}
