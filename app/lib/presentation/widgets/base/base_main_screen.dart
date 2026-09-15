import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

class BaseMainScreen extends StatefulWidget {
  final Widget? topBar;
  final Widget body;
  final Widget? bottom;

  const new({
    super.key,
    this.topBar,
    required this.body,
    this.bottom,
  });

  static BaseMainScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<BaseMainScreenState>();

  @override
  State<BaseMainScreen> createState() => BaseMainScreenState();
}

class BaseMainScreenState extends State<BaseMainScreen> {
  @override
  Widget build(BuildContext context) {
    return StyledContainer(
      contextStyle: .body,
      borderRadius: context.values.borderXL,
      child: Column(
        children: [
          SizedBox(
            height: context.values.topBarHeight,
            child: widget.topBar,
          ),
          Divider.shrink(),
          Expanded(child: widget.body),
          ?widget.bottom,
        ],
      ),
    );
  }
}

class const IsDirtyHandler({
  super.key,
  required super.child,
  required final bool popCanceled,
}) extends InheritedWidget {
  static IsDirtyHandler? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<IsDirtyHandler>();

  static IsDirtyHandler of(BuildContext context) => maybeOf(context)!;

  @override
  bool updateShouldNotify(covariant IsDirtyHandler oldWidget) {
    return popCanceled != oldWidget.popCanceled;
  }
}

class const BaseSettingsScreen({
  super.key,
  required final GlobalKey<FormState> formKey,
  required final Widget child,
  required final Future Function(FormState formState) save,
}) extends StatefulWidget {
  static BaseSettingsScreenState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<BaseSettingsScreenState>();

  static BaseSettingsScreenState of(BuildContext context) => maybeOf(context)!;

  @override
  State<BaseSettingsScreen> createState() => BaseSettingsScreenState();
}

class BaseSettingsScreenState extends State<BaseSettingsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  OverlayEntry? _overlayEntry;

  bool isDirty = false;
  bool popCanceled = false;

  void onChanged() {
    if (isDirty == false) {
      if (hasOriginalState() == false) setDirty();
    } else {
      if (hasOriginalState()) {
        stateReset();
      }
    }
  }

  bool hasOriginalState() {
    return widget.formKey.currentState!.fields.any((x) => x.isDirty) == false;
  }

  void setDirty() {
    setState(() {
      isDirty = true;
    });
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return SlideTransition(
          position: _slideAnimation,
          child: IsDirtyBar(),
        );
      },
    );

    _overlayKey.currentState!.insert(_overlayEntry!);
    _controller.forward(from: 0);
    CloseVetoManager.of(context).setValue(false, onPopCancel);
  }

  Future save() async {
    widget.save(widget.formKey.currentState!).then((value) => stateReset());
  }

  void reset() {
    widget.formKey.currentState!.reset();
    stateReset();
  }

  void stateReset() {
    hideBottomOverlay();
    setState(() {
      isDirty = false;
      popCanceled = false;
      CloseVetoManager.of(context).setValue(true, null);
    });
  }

  void onPopCancel() {
    setState(() {
      popCanceled = true;
    });
    WidgetShaker.of(context).shake();
  }

  Future<void> hideBottomOverlay() async {
    if (_overlayEntry == null) return;

    await _controller.reverse();

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 1), // poniżej ekranu
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _controller.dispose();
    super.dispose();
  }

  final _overlayKey = GlobalKey<OverlayState>(debugLabel: "overlay host");

  @override
  Widget build(BuildContext context) {
    return IsDirtyHandler(
      popCanceled: popCanceled,
      child: Overlay(
        key: _overlayKey,
        initialEntries: [
          OverlayEntry(
            builder: (context) {
              return Form(
                onPopInvokedWithResult: (didPop, result) {
                  debugPrint(["Tried to pop", didPop, result].toString());
                  if (isDirty) onPopCancel();
                },
                canPop: isDirty == false,
                autovalidateMode: .onUserInteraction,
                onChanged: onChanged,
                key: widget.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: .all(8),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(
                        Size.fromWidth(1000),
                      ),
                      child: widget.child,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
