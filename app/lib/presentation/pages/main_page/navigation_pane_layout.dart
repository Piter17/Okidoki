import 'package:riv/presentation/presentation.dart';

class const NavigationPane({
  super.key,
  required final Widget? floatingChild,
  required final Widget navigator,
}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final userBottomBarKey = useMemoized(() => GlobalKey());
    final bottomSpace = useState<double?>(null);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) {
          return;
        }
        final renderBottomBox =
            userBottomBarKey.currentContext?.findRenderObject() as RenderBox?;
        bottomSpace.value = renderBottomBox?.size.height;
      });
      return null;
    }, const []);

    return LayoutBuilder.constraints(
      builder: (context, constraints) {
        return NavigationPaneLayoutScope(
          bottomSpace: bottomSpace.value,
          child: Stack(
            children: [
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GuildList(),
                    Divider.shrink(),
                    Expanded(child: navigator),
                  ],
                ),
              ),
              if (floatingChild != null)
                Positioned(
                  key: userBottomBarKey,
                  left: 8,
                  right: 8,
                  bottom: 8,
                  child: floatingChild!,
                ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationPaneLayoutScope extends InheritedWidget {
  const NavigationPaneLayoutScope({
    super.key,
    required this.bottomSpace,
    required super.child,
  });

  final double? bottomSpace;

  static NavigationPaneLayoutScope? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NavigationPaneLayoutScope>();
  }

  static NavigationPaneLayoutScope of(BuildContext context) =>
      maybeOf(context)!;

  @override
  bool updateShouldNotify(NavigationPaneLayoutScope oldWidget) {
    return oldWidget.bottomSpace != bottomSpace;
  }
}
