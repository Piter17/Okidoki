import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

class LanguageSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    return BaseSettingsPage.column(
      [
        TitleEntry(Text(context.s.settings_language_and_time)),
        DropdownEntryAlt<Language>(
          getLabel: (item) => item?.name(context.s),
          text: Text(context.s.settings_language),
          value: settings.language,
          items: Language.list,
          onItemSelected: (newItem) {
            if (newItem != null) {
              ref.read(appSettingsProvider.notifier).setLanguage(newItem);
            }
          },
        ),
      ],
    );
  }
}
