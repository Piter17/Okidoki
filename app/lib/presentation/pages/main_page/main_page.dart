import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

@RoutePage()
class MainPage extends StatefulHookConsumerWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  void handleMessageReceived(ChatMessageDto message) {}

  final profileKey = GlobalKey();
  final mainViewKey = GlobalKey();
  final routerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(currentUserProfileProvider);
    ref.listen(signalrGatewayProvider, (_, next) {
      next.when(
        data: (event) {
          return switch (event) {
            MessageReceived(:final message) => handleMessageReceived(message),
            RealTimeEvent() => null,
          };
        },
        error: (e, st) {
          debugPrint(e.toString());
          debugPrintStack(stackTrace: st);
        },
        loading: () {},
      );
    });

    return AutoRouter(
      key: routerKey,
      navigatorObservers: () => [ref.read(appRouterObserverProvider)],
      builder: (context, content) {
        final router = AutoRouter.of(context, watch: true);
        final current = router.currentChild;

        final navigator = switch (current?.args) {
          GuildRouteArgs(:final guildId) => GuildNavigator(
            guildId: guildId,
            channelId: null,
          ),
          GuildChatRouteArgs(:final guildId, :final channelId) =>
            GuildNavigator(
              guildId: guildId,
              channelId: channelId,
            ),
          _ => const DmNavigator(),
        };

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: MainPageLayout(
              userBar: UserBottomBar(
                key: profileKey,
                user: userProfile.value,
              ),
              navigatior: navigator,
              mainView: content,
              //  KeyedSubtree(
              //   key: mainViewKey,
              //   child: content,
              // ),
            ),
          ),
        );
      },
    );
  }
}
