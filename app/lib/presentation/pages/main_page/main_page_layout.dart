import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';

class const MainPageLayout({
  super.key,
  required final Widget userBar,
  required final Widget mainView,
  required final Widget navigatior,
}) extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = usePageController(
      initialPage: 0,
      keepPage: true,
    );

    final url = AutoRouter.of(context).currentUrl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          url,
          textAlign: .start,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, layoutType, isPhone) => switch (layoutType) {
              .phone => PageView(
                controller: pageController,
                children: [
                  NavigationPane(
                    floatingChild: userBar,
                    navigator: navigatior,
                  ),
                  mainView,
                ],
              ),
              .tablet || .desktop => ResizableSplitLayout(
                viewKey: "mainView",
                leftChild: NavigationPane(
                  floatingChild: userBar,
                  navigator: navigatior,
                ),
                rightChild: mainView,
              ),
            },
          ),
        ),
      ],
    );
  }
}
