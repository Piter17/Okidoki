import 'package:auto_route/auto_route.dart';
import 'package:okidoki/presentation/presentation.dart';
// ignore: unnecessary_import
import 'package:okidoki/presentation/routers/router_config.gr.dart';
import 'package:okidoki/providers/providers.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  final Ref ref;
  AppRouter(this.ref);

  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: TransitionsBuilders.noTransition,
  );
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      path: '/',

      guards: [AuthGuard(ref)],
      type: RouteType.material(),
      children: [
        AutoRoute(
          page: EmptyRoute.page,
          initial: true,
          maintainState: false,
        ),
        AutoRoute(
          page: GuildRoute.page,
          path: 'guild/:guildId',
          maintainState: false,
        ),
        AutoRoute(
          page: GuildChatRoute.page,
          path: 'chat/:guildId/:channelId',
          maintainState: false,
        ),
        AutoRoute(
          page: FriendsRoute.page,
          path: 'friends',
          maintainState: false,
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: 'settings',
          type: RouteType.cupertino(),
          maintainState: false,
        ),
      ],
    ),
    AutoRoute(
      page: AuthRoute.page,
      path: '/',
    ),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: RegisterRoute.page, path: '/register'),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final currentUser = ref.watch(currentUserProvider);

    if (currentUser.hasValue && currentUser.value != null) {
      resolver.next(true);
    } else {
      router.replace(const AuthRoute());
    }
  }
}
