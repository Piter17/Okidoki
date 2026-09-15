import 'package:darq/darq.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

class LanguageSettingsPage extends HookConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          context.s.settings_language_and_time,
          style: context.fonts.largeTitle,
        ),
        DropdownEntry<Language>(
          text: Text(context.s.settings_language),
          value: settings.language,
          possibleValues: Language.list.toMap(
            (x) => MapEntry(x, x.name(context.s)),
          ),
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
