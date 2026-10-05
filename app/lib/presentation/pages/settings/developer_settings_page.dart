import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';
import 'package:okidoki/utils/utils.dart';

class const DeveloperSettingsPage({super.key}) extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    final tokenStorage = ref.watch(tokenStorageProvider);

    return BaseSettingsPage.column([
      TitleEntry(Text(context.s.settings_developer_mode)),
      SwitchEntry(
        text: Text(context.s.settings_developer_mode),
        subText: Text(context.s.settings_developer_mode_description),
        value: settings.developerMode,
        onChanged: ref.read(appSettingsProvider.notifier).setDeveloperMode,
      ),
      if (settings.developerMode) ...[
        ButtonEntry(
          text: Text(context.s.settings_developer_mode_copy_bearer),
          onTapped: () =>
              tokenStorage.value?.accessToken.mapOr(ClipboardHelpers.setText),
        ),
        ButtonEntry(
          text: Text(context.s.settings_developer_mode_copy_refresh),
          onTapped: () =>
              tokenStorage.value?.refreshToken.mapOr(ClipboardHelpers.setText),
        ),
      ],
    ]);
  }
}
