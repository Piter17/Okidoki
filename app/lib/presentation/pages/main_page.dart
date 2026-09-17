import 'package:api_bindings/api_bindings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:riv/core/back_long_press_bus.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

@RoutePage()
class MainPage extends StatefulHookConsumerWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => MainPageState();
}

class MainPageState extends ConsumerState<MainPage> {
  final PageController _pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  void handleMessageReceived(ChatMessageDto message) {}

  @override
  Widget build(BuildContext context) {
    final backButtonStream = useOnStreamChange(BackLongPressBus.stream);
    backButtonStream?.onData((data) {
      debugPrint(["OnLongPressBackButton", "ctx", context].toString());
      if (context.mounted) NavigationStackDialog.open(context, ref);
    });

    final navigation = ref.watch(chatNavigationProvider);

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

    final view = LayoutBuilder(
      builder: (context, layoutType, isPhone) => switch (layoutType) {
        .phone => PageView(
          controller: _pageController,
          children: [
            NavigationMenu(),
            navigation.current?.getMainView() ?? EmptyPage(),
          ],
        ),
        .tablet || .desktop => ResizableSplitLayout(
          viewKey: "mainView",
          leftChild: NavigationMenu(),
          rightChild: navigation.current?.getMainView() ?? EmptyPage(),
        ),
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: view),
    );
  }
}

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => NavigationMenuState();
}

class NavigationMenuState extends ConsumerState<NavigationMenu> {
  final GlobalKey _userBottomBarKey = GlobalKey();
  double? _bottomSpace;

  double? get bottomSpace => _bottomSpace;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBottomBox =
          _userBottomBarKey.currentContext?.findRenderObject() as RenderBox?;
      setState(() {
        _bottomSpace = renderBottomBox?.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(currentUserProfileProvider);
    final navigation = ref.watch(chatNavigationProvider);

    return LayoutBuilder.constraints(
      builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GuildList(bottomSpace: _bottomSpace),
                  Space(space: 1),
                  Expanded(
                    child:
                        navigation.current?.getNavigatorView(bottomSpace) ??
                        Container(),
                  ),
                ],
              ),
            ),
            Positioned(
              key: _userBottomBarKey,
              left: 8,
              right: 8,
              bottom: 8,
              child: UserBottomBar(user: userProfile.value),
            ),
          ],
        );
      },
    );
  }
}
