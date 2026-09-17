import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class GuildSettingsPage extends HookConsumerWidget {
  const new({
    super.key,
    required this.settings,
  });

  final List<SettingsTab> settings;

  static Future<void> open(BuildContext context, String guildId) {
    final guildSettings = [
      SettingsTab(
        lang: (s) => s.guild_title,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => GuildGeneralSettingsPage(
          guildId: guildId,
        ),
      ),
      SettingsTab(
        lang: (s) => s.guild_roles,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => GuildRolesPage(),
      ),
      SettingsTab(
        lang: (s) => s.guild_members,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => const SizedBox(
          height: 1000,
          child: Placeholder(),
        ),
      ),
      SettingsTab(
        lang: (s) => s.guild_channels,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => const SizedBox(
          height: 1000,
          child: Placeholder(),
        ),
      ),
    ];

    return showResponsivePopup(
      context: context,
      builder: (context) =>
          WidgetShaker(child: GuildSettingsPage(settings: guildSettings)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewKey = useMemoized(() => GlobalKey());
    final selectedMenu = useState(settings.first);
    return CloseVetoManager(
      child: AdaptableLayout(
        layoutChangedCallback: (o, n) {
          debugPrint(["layoutChangedCallback", o, n].toString());
        },
        navigator: SettingsNavigationBar(
          settings: settings,
          selectMenu: selectedMenu.set,
          selectedMenu: selectedMenu.value,
        ),
        content: KeyedSubtree(
          key: viewKey,
          child: Builder(builder: selectedMenu.value.pageBuilder!),
        ),
        topBar: SettingsTopBar(
          selectedMenu: selectedMenu.value,
        ),
      ),
    );
  }
}
