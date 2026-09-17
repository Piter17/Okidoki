import 'package:auto_route/auto_route.dart';

import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/utils/utils.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const new({super.key, required this.settings});

  final List<SettingsTab> settings;

  static Future<void> open(BuildContext context) {
    final userSettings = [
      SettingsTab(
        lang: (s) => s.settings_account,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => ProfileSettingsPage(),
      ),
      SettingsTab(
        lang: (s) => s.settings_theme,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => ThemeSettingsPage(),
      ),
      SettingsTab(
        lang: (s) => s.settings_language_and_time,
        icon: Icons.insert_chart_outlined_sharp,
        pageBuilder: (context) => LanguageSettingsPage(),
      ),
      SettingsTab.button(
        lang: (x) => x.generic_logoff,
        icon: Icons.insert_chart_outlined_sharp,
        onTap: (context, ref) {
          ref.read(tokenStorageProvider.notifier).logOff();
        },
      ),
    ];
    return showResponsivePopup(
      context: context,
      builder: (context) =>
          WidgetShaker(child: SettingsPage(settings: userSettings)),
    );
  }

  @override
  Widget build(BuildContext context) {
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

class SettingsTopBar extends StatelessWidget {
  const new({
    super.key,
    required this.selectedMenu,
  });

  final SettingsTab? selectedMenu;

  @override
  Widget build(BuildContext context) {
    final adaptableLayout = AdaptableLayout.maybeOf(context);
    return BaseTopBar(
      prefixIcon: Button(
        buttonType: .primary,
        onPressed: adaptableLayout?.backToMenu,
        child: Text(context.s.generic_back),
      ),
      title: Text(selectedMenu?.lang(S.of(context)!) ?? ""),
      actions: [
        ValueListenableBuilder<CloseVetoValue>.maybe(
          valueListenable: CloseVetoManager.maybeOf(context)?.value,
          defaultValue: CloseVetoValue.def(),
          builder: (context, close, body) => IconButton(
            onPressed: close.canClose == false
                ? () => close.onCloseDeny?.call()
                : () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}

class SettingsNavigationBar extends ConsumerStatefulWidget {
  const new({
    super.key,
    required this.settings,
    required this.selectedMenu,
    required this.selectMenu,
  });

  final List<SettingsTab> settings;
  final SettingsTab? selectedMenu;
  final void Function(SettingsTab target) selectMenu;

  @override
  ConsumerState<SettingsNavigationBar> createState() =>
      _SettingsNavigationBarState();
}

class _SettingsNavigationBarState extends ConsumerState<SettingsNavigationBar> {
  @override
  Widget build(BuildContext context) {
    void onSelect(SettingsTab x, CloseVetoValue close) {
      x.pageBuilder != null
          ? widget.selectMenu(x)
          : x.onTap?.call(context, ref);
      AdaptableLayout.maybeOf(context)?.onSwitchPage();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: S.of(context)!.generic_search,
              isCollapsed: false,
              isDense: true,
              prefixIcon: Icon(Icons.search),
            ),
          ),
          Divider(),
          Text(context.s.settings_user),
          ValueListenableBuilder<CloseVetoValue>.maybe(
            valueListenable: CloseVetoManager.maybeOf(context)?.value,
            defaultValue: CloseVetoValue.def(),
            builder: (context, close, child) => Column(
              crossAxisAlignment: .stretch,
              children: widget.settings
                  .map(
                    (x) => Button.icon(
                      buttonType: widget.selectedMenu == x
                          ? ButtonType.textRadioOn
                          : ButtonType.textRadio,
                      onPressed: () => onSelect(x, close),
                      label: Text(x.lang(S.of(context)!)),
                      icon: Icon(x.icon),
                    ),
                  )
                  .toList(),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class SettingsTab {
  final String Function(S) lang;
  final IconData icon;
  final Widget Function(BuildContext context)? pageBuilder;
  final void Function(BuildContext context, WidgetRef ref)? onTap;

  const new({
    required this.lang,
    required this.icon,
    required this.pageBuilder,
  }) : onTap = null;

  const new button({
    required this.lang,
    required this.icon,
    required this.onTap,
  }) : pageBuilder = null;
}
