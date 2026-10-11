import 'package:auto_route/auto_route.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/auth/register_options.dart';

@RoutePage()
class const AuthPage({super.key}) extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerOptions = ref.watch(registerOptionsProvider);
    return Scaffold(
      body: BackgroundPage(
        drawLogo: true,
        logoOutsideContainer: false,
        isLoading: false,
        child: registerOptions.when(
          data: (_) => AutoRouter(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => const _ErrorScreen(),
        ),
      ),
    );
  }
}

class const _ErrorScreen() extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerOptions = ref.watch(registerOptionsProvider);
    return Column(
      children: [
        Text('Error loading register options'),
        Button(
          onPressed: registerOptions.isLoading
              ? null
              : () => ref.invalidate(registerOptionsProvider),
          child: Text('Retry'),
        ),
      ],
    );
  }
}
