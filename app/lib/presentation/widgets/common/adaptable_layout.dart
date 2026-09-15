import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

class const AdaptableLayout({
  super.key,
  required final Widget navigator,
  required final Widget content,
  required final Widget? topBar,
  required final LayoutChangedCallback? layoutChangedCallback,
}) extends StatefulWidget {
  static AdaptableLayoutState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<AdaptableLayoutState>();
  static AdaptableLayoutState of(BuildContext context) => maybeOf(context)!;

  @override
  State<AdaptableLayout> createState() => AdaptableLayoutState();
}

class AdaptableLayoutState extends State<AdaptableLayout> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void backToMenu() =>
      _controller.hasClients.then(() => _controller.jumpToPage(0));

  void onSwitchPage() => _controller.hasClients.then(
    () => _controller.jumpToPage(1),
  );

  // final contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      layoutChangedCallback: widget.layoutChangedCallback,
      builder: (context, device, isPhone) {
        return switch (device) {
          .phone => BaseMainScreen(
            topBar: widget.topBar,
            body: PageView(
              controller: _controller,
              children: [
                widget.navigator,
                widget.content,
              ],
            ),
          ),
          _ => Row(
            children: [
              SizedBox(
                width: 250,
                child: widget.navigator,
              ),
              Expanded(
                child: BaseMainScreen(
                  topBar: widget.topBar,
                  body: widget.content,
                ),
              ),
            ],
          ),
        };
      },
    );
  }
}

class KeepAlivePage extends StatefulWidget {
  final Widget child;
  const KeepAlivePage({super.key, required this.child});

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
