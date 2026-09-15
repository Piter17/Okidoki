import 'package:riv/presentation/presentation.dart';

class GuildRolesPage extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final guildId = GuildSettingsPage.of(context).guildId;
    // final guild = ref.watch(guildProvider(guildId));
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Section(
          header: TitleEntry(Text(context.s.guild_roles)),
          body: TextEntry(
            text: Text(context.s.guild_role_placeholder),
            value: context.s.guild_role_placeholder,
          ),
        ),
      ],
    );
  }
}
