import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

class ThemeSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(currentThemeProvider);

    return BaseSettingsPage.column(
      [
        TitleEntry(Text(context.s.settings_theme_title)),
        DropdownEntry<Brightness?>(
          text: Text(context.s.settings_theme_mode),
          value: theme.brightness,
          possibleValues: {
            null: context.s.settings_theme_system,
            Brightness.light: context.s.settings_theme_light,
            Brightness.dark: context.s.settings_theme_dark,
          },
          onItemSelected: ref.read(currentThemeProvider.notifier).setBrightness,
        ),
        DropdownEntry<Color?>(
          text: Text(context.s.settings_primary_color),
          value: theme.primaryColor,
          possibleValues: {
            Color(0xff7d0340): context.s.settings_color_red,
            Color(0xff78ed78): context.s.settings_color_green,
            Color(0xff0d6efd): context.s.settings_color_blue,
            CurrentTheme.defaultPrimaryColor: context.flexTranslations.Default(
              .male,
            ),
          },
          onItemSelected: ref.read(currentThemeProvider.notifier).setColor,
        ),
      ],
    );
  }
}
