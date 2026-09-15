import 'package:riv/presentation/presentation.dart';

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

// // class const CloseVetoManager({
// //   super.key,
// //   required final Widget child,
// // }) extends StatefulWidget {
// //   static CloseVetoManagerState? maybeOf(BuildContext context) =>
// //       context.findAncestorStateOfType<CloseVetoManagerState>();

// //   static CloseVetoManagerState of(BuildContext context) => maybeOf(context)!;

// //   @override
// //   State<CloseVetoManager> createState() => CloseVetoManagerState();
// // }

// // class CloseVetoManagerState extends State<CloseVetoManager> {
// //   bool canClose = true;
// //   VoidCallback? onCloseDeny;

// //   void setValue(bool canClose, VoidCallback? onCloseDeny) => setState(() {
// //     this.canClose = canClose;
// //     this.onCloseDeny = onCloseDeny;
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return CloseVeto(
// //       canClose: canClose,
// //       onCloseDeny: onCloseDeny,
// //       child: widget.child,
// //     );
// //   }
// // }

// class const CloseVeto({
//   super.key,
//   required final bool canClose,
//   required final VoidCallback? onCloseDeny,
//   required super.child,
// }) extends InheritedWidget {
//   @override
//   bool updateShouldNotify(covariant CloseVeto oldWidget) {
//     return canClose != oldWidget.canClose ||
//         onCloseDeny != oldWidget.onCloseDeny;
//   }

//   static CloseVeto? maybeOf(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<CloseVeto>();

//   static CloseVeto of(BuildContext context) => maybeOf(context)!;
// }

// class CloseVetoValue {
//   final bool canClose;
//   final VoidCallback? onCloseDeny;

//   const CloseVetoValue({
//     required this.canClose,
//     this.onCloseDeny,
//   });
// }

// class CloseVetoManager extends StatefulWidget {
//   const CloseVetoManager({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   static CloseVetoManagerState of(BuildContext context) {
//     return context.findAncestorStateOfType<CloseVetoManagerState>()!;
//   }

//   @override
//   State<CloseVetoManager> createState() => CloseVetoManagerState();
// }

// class CloseVetoManagerState extends State<CloseVetoManager> {
//   final value = ValueNotifier<CloseVetoValue>(
//     const CloseVetoValue(canClose: true),
//   );

//   void setValue(
//     bool canClose,
//     VoidCallback? onCloseDeny,
//   ) {
//     value.value = CloseVetoValue(
//       canClose: canClose,
//       onCloseDeny: onCloseDeny,
//     );
//   }

//   @override
//   void dispose() {
//     value.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<CloseVetoValue>(
//       valueListenable: value,
//       builder: (context, value, child) {
//         return CloseVeto(
//           canClose: value.canClose,
//           onCloseDeny: value.onCloseDeny,
//           child: child!,
//         );
//       },
//       child: widget.child,
//     );
//   }
// }
