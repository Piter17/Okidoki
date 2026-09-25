import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter(ref);
});

final appRouterObserverProvider = Provider<MyObserver>((ref) {
  return MyObserver(ref);
});

class MyObserver(final Ref ref) extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    final _ = switch (route.settings.arguments) {
      GuildChatRouteArgs(:final guildId, :final channelId) => Future(
        () => ref
            .read(userSettingsProvider.notifier)
            .setLastGuild("$guildId/$channelId"),
      ),
      _ => null,
    };
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
