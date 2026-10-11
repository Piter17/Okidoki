import 'package:auto_route/auto_route.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

@RoutePage()
class ResetPage extends ConsumerStatefulWidget {
  const ResetPage({super.key});

  @override
  ConsumerState<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends ConsumerState<ResetPage> {
  @override
  void initState() {
    super.initState();
    _reset();
  }

  Future<void> _reset() async {
    await Future.wait([
      ref.read(secureStorageProvider).deleteAll(),
      ref.read(globalPreferencesProvider).clear(),
    ]);
    ref.invalidate(tokenStorageProvider);
    ref.invalidate(currentUserProvider);
    ref.invalidate(appSettingsProvider);
    ref.invalidate(userSettingsProvider);
    if (mounted) {
      await context.router.replacePath('/');
    }
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
