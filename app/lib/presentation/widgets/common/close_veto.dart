import 'package:okidoki/presentation/presentation.dart';

class CloseVetoManager extends StatefulWidget {
  const CloseVetoManager({
    super.key,
    required this.child,
  });

  final Widget child;

  static CloseVetoManagerState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<CloseVetoManagerState>();

  static CloseVetoManagerState of(BuildContext context) => maybeOf(context)!;

  @override
  State<CloseVetoManager> createState() => CloseVetoManagerState();
}

class CloseVetoManagerState extends State<CloseVetoManager> {
  final value = ValueNotifier<CloseVetoValue>(
    const CloseVetoValue.def(),
  );

  void setValue(
    bool canClose,
    VoidCallback? onCloseDeny,
  ) {
    value.value = CloseVetoValue(
      canClose: canClose,
      onCloseDeny: onCloseDeny,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CloseVetoValue>(
      valueListenable: value,
      child: widget.child,
      builder: (context, close, child) {
        return PopScope(
          canPop: close.canClose,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              close.onCloseDeny?.call();
            }
          },
          child: child!,
        );
      },
    );
  }

  @override
  void dispose() {
    value.dispose();
    super.dispose();
  }
}

class CloseVetoValue {
  const new({
    required this.canClose,
    this.onCloseDeny,
  });

  const new def() : canClose = true, onCloseDeny = null;

  final bool canClose;
  final VoidCallback? onCloseDeny;
}
