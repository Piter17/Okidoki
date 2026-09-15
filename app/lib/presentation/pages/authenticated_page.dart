import 'package:auto_route/annotations.dart';
import 'package:riv/presentation/presentation.dart';

@RoutePage()
class AuthenticatedPage extends ConsumerWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AuthenticatedPage();
    // return TickerMode(enabled: true, child: _AuthenticatedPage());
  }
}

class _AuthenticatedPage extends ConsumerWidget {
  const new();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(signalrGatewayProvider, ((previous, next) {}));
    // final guilds = ref.watch(guildsProvider);
    // // final signalRClient = ref.watch(signalRClientProvider);
    // // final navigatorWidth = ref.watch(
    // //   settingsProvider<double>("navigatorWidth"),
    // // );
    // final requests = ref.watch(friendRequestsProvider);
    // final invites = ref.watch(friendInvitesProvider);
    // // final theme = ref.watch(settingsProvider<bool>("brightness"));
    // // final lastGuild = ref.watch(settingsProvider<int>("lastGuild"));

    // final userProfile = ref.watch(currentUserProfileProvider);

    // final isLoading = [
    //   guilds,
    //   // signalRClient,
    //   // navigatorWidth,
    //   // lastGuild,
    //   userProfile,
    //   requests,
    //   invites,
    //   // theme,
    // ].any((x) => x.isLoading);

    // final themeManager = ThemeValues.of(context);
    // debugPrint('Calling changeBrightness from ${context.runtimeType}');
    // theme.whenData(
    //   (x) => themeManager.changeBrightness(x! ? .light : .dark),
    // );

    return ChatHostPage();
    // return isLoading
    //     ? Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       )
    //     : Actions(
    //         actions: {
    //           ShowGotoIntent: ShowGotoAction(),
    //         },
    //         child: ChatHostPage(),
    //       );
  }
}
