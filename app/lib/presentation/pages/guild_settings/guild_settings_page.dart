import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class GuildSettingsPage extends StatefulHookConsumerWidget {
  const new({
    super.key,
    required this.settings,
    required this._guildId,
  });

  final String _guildId;
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

    final layoutType = LayoutType.fromContext(context);
    debugPrint(layoutType.toString());

    if (DeviceUtils.isPhone) {
      return showModalBottomSheet(
        context: context,
        builder: (context) =>
            GuildSettingsPage(settings: guildSettings, guildId: guildId),
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) => WidgetShaker(
          child: Dialog(
            // insetPadding: .all(40),

            constraints: BoxConstraints(
              maxWidth: 1500,
              maxHeight: 700,
              minHeight: 350,
              minWidth: 360,
            ),
            child: GuildSettingsPage(settings: guildSettings, guildId: guildId),
          ),
        ),
      );
    }
  }

  static GuildSettingsPageState of(BuildContext context) =>
      context.findAncestorStateOfType<GuildSettingsPageState>()!;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      GuildSettingsPageState();
}

class GuildSettingsPageState extends ConsumerState<GuildSettingsPage> {
  String get guildId => widget._guildId;

  late SettingsTab selectedMenu = widget.settings.first;
  // final viewKey = GlobalKey<FormState>(
  //   debugLabel: "GuildSettingsPageState.viewKey.${math.Random().nextInt(1000)}",
  // );

  void setMenu(SettingsTab x) => setState(() {
    selectedMenu = x;
  });
  // final selectedMenu = useState<SettingsTab?>(null);

  final viewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CloseVetoManager(
      child: AdaptableLayout(
        layoutChangedCallback: (o, n) {
          debugPrint(["layoutChangedCallback", o, n].toString());
        },
        navigator: SettingsNavigationBar(
          settings: widget.settings,
          selectMenu: setMenu,
          selectedMenu: selectedMenu,
        ),
        content: KeyedSubtree(
          key: viewKey,
          child: Builder(builder: selectedMenu.pageBuilder!),
        ),
        topBar: SettingsTopBar(
          selectedMenu: selectedMenu,
        ),
      ),
    );
  }
}
