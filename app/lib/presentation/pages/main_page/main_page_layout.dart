import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:okidoki/presentation/presentation.dart';
import 'package:okidoki/providers/providers.dart';

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
    final user = ref.watch(currentUserProvider).requireValue;
    final url = AutoRouter.of(context).currentUrl;
    final settings = ref.watch(appSettingsProvider);

    final hasEmail = user?.email != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (settings.developerMode && !kIsWeb)
          Text(
            url,
            textAlign: .start,
          ),
        if (hasEmail == false)
          Container(
            alignment: Alignment.center,
            color: context.appColors.info.color,
            child: Padding(
              padding: context.values.buttonPadding,
              child: Text("Please set your email"),
            ),
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
