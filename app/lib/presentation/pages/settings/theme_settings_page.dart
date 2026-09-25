import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

class ThemeSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    final brightness = settings.darkMode;
    return BaseSettingsPage.column(
      [
        TitleEntry(Text(context.s.settings_theme_title)),
        SwitchEntry(
          text: Text(context.s.settings_light_theme),
          value: brightness,
          onChanged: ref.read(appSettingsProvider.notifier).setDarkMode,
        ),
        DropdownEntry<Color>(
          text: Text(context.s.settings_primary_color),
          value: settings.color,
          possibleValues: {
            Color(0xffff0000): context.s.settings_color_red,
            Color(0xff00ff00): context.s.settings_color_green,
            Color(0xff0000ff): context.s.settings_color_blue,
          },
          onItemSelected: (newItem) {
            if (newItem != null) {
              ref.read(appSettingsProvider.notifier).setColor(newItem);
            }
          },
        ),
      ],
    );
  }
}
