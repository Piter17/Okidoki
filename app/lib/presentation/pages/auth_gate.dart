import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:riv/providers/users/current_user.dart';

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  late final _router = widget.child as Router<Object>;
  late final _routerDelegate = _router.routerDelegate as AutoRouterDelegate;
  late final _appRouter = _routerDelegate.controller as AppRouter;
  ProviderSubscription<AsyncValue<IdentityDto?>>? _currentUserSubscription;

  void _navigateToLoginPage() => _appRouter.replaceAll([LoginRoute()]);
  void _navigateToChatPage() => _appRouter.replaceAll([MainRoute()]);

  @override
  void initState() {
    super.initState();
    _currentUserSubscription = ref.listenManual<AsyncValue<IdentityDto?>>(
      currentUserProvider,
      (prev, next) {
        debugPrint(
          [
            "AuthGate: currentUserProvider",
            "isLoading: ${prev?.isLoading} -> ${next.isLoading}",
            "isReloading: ${prev?.isReloading} -> ${next.isReloading}",
            "isRefreshing: ${prev?.isRefreshing} -> ${next.isRefreshing}",
            "hasError: ${prev?.hasError} -> ${next.hasError}",
            "hasValue: ${prev?.hasValue} -> ${next.hasValue}",
            "value?.userId: ${prev?.value?.userId} -> ${next.value?.userId}",
            "value?.userName: ${prev?.value?.userName} -> ${next.value?.userName}",
          ].join("\n"),
        );

        if (prev == null) {
          return;
        }

        next.when(
          data: (user) {
            final previousUserId = prev.value?.userId;
            final nextUserId = user?.userId;

            if (user != null && previousUserId == null && nextUserId != null) {
              _navigateToChatPage();
            } else if (user == null && previousUserId != null) {
              _navigateToLoginPage();
            }
          },
          error: (error, stack) {},
          loading: () {},
        );
      },
      fireImmediately: true,
    );
  }

  @override
  void dispose() {
    _currentUserSubscription?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);

    return user.map(
      data: (d) => ThemeManager(child: widget.child),
      error: (e) => Column(
        crossAxisAlignment: .center,
        children: [
          Text(context.s.auth_connection_error(e.toString())),
          Button(
            buttonType: .primary,
            onPressed: () => ref.invalidate(currentUserProvider),
            child: Text(context.s.generic_retry),
          ),
          Button(
            buttonType: .secondary,
            onPressed: () => _navigateToLoginPage,
            child: Text(context.s.auth_go_to_login),
          ),
        ],
      ),
      loading: (l) => Center(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
