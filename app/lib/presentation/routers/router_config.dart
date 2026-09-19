import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
// ignore: unnecessary_import
import 'package:riv/presentation/routers/router_config.gr.dart';
import 'package:riv/providers/providers.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final Ref ref;
  AppRouter(this.ref);

  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      guards: [AuthGuard(ref)],
    ),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
    // AutoRoute(
    //   page: AuthenticatedRoute.page,
    //   path: '/logged',
    //   // children: [
    //   //   AutoRoute(page: ChatRoute.page, path: 'chat'),
    //   // ],
    // ),
    AutoRoute(
      page: SettingsRoute.page,
      path: '/settings',
      type: RouteType.cupertino(),
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [];

  static AppRouter of(BuildContext context, {bool watch = false}) =>
      AutoRouter.of(context, watch: watch) as AppRouter;
}

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final currentUser = ref.read(currentUserProvider);

    if (currentUser.hasValue && currentUser.value != null) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
