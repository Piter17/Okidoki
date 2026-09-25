import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riv/core/core.dart';
import 'package:riv/presentation/presentation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, //colors.primary.color,
          brightness: Brightness.dark,
          dynamicSchemeVariant: .vibrant,
        ),
      ),
      home: ContextMenuControllerExampleApp(),
    );
  }
}

/// A builder that includes an Offset to draw the context menu at.
typedef ContextMenuBuilder = Widget Function(
  BuildContext context,
  Offset offset,
  List<CtxMenuItem> items,
);

typedef ContextMenuItemBuilder = Widget Function(
  BuildContext context,
  CtxMenuItem item,
);

class ContextMenuControllerExampleApp extends StatefulWidget {
  const ContextMenuControllerExampleApp({super.key});

  @override
  State<ContextMenuControllerExampleApp> createState() =>
      _ContextMenuControllerExampleAppState();
}

class _ContextMenuControllerExampleAppState
    extends State<ContextMenuControllerExampleApp> {
  void _showDialog(BuildContext context) {
    Navigator.of(context).push(
      DialogRoute<void>(
        context: context,
        builder: (BuildContext context) =>
            const AlertDialog(title: Text('You clicked print!')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Context menu outside of text')),
      body: CtxMenuRegion(
        items: [
          CtxMenuItem(
            label: (context) => 'Print',
            onPressed: () => _showDialog(context),
          ),
          CtxMenuItem(
            label: (context) => 'Copy',
            onPressed: () => _showDialog(context),
          ),
        ],
        // In this case this wraps a big open space in a GestureDetector in
        // order to show the context menu, but it could also wrap a single
        // widget like an Image to give it a context menu.
        child: ListView(
          children: <Widget>[
            Container(height: 20.0),
            const Text(
              'Right click (desktop) or long press (mobile) anywhere, not just on this text, to show the custom menu.',
            ),
          ],
        ),
      ),
    );
  }
}

class CtxMenuItem({
  required final TranslationCallback label,
  required final VoidCallback onPressed,
  final bool isEnabled = true,
});

class const CtxMenu({
  super.key,
  required final Offset offset,
  required final List<CtxMenuItem> items,
}) extends StatelessWidget {
  void buttonOnPressed(CtxMenuItem item) {
    ContextMenuController.removeAny();
    item.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Material(
        color: Colors.black,
        type: MaterialType.card,
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: items
                .map(
                  (item) => TextButton(
                    onPressed: () => buttonOnPressed(item),
                    child: Text(item.label(context.s)),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

/// Shows and hides the context menu based on user gestures.
///
/// By default, shows the menu on right clicks and long presses.
class CtxMenuRegion extends StatefulWidget {
  /// Creates an instance of [CtxMenuRegion].
  const CtxMenuRegion({
    required this.child,
    required this.items,
  }) : menuBuilder = null;

  const CtxMenuRegion.custom({
    required this.child,
    required this.menuBuilder,
    required this.items,
  });

  /// Builds the context menu.
  final ContextMenuBuilder? menuBuilder;
  final List<CtxMenuItem> items;

  /// The child widget that will be listened to for gestures.
  final Widget child;

  @override
  State<CtxMenuRegion> createState() => _CtxMenuRegionState();
}

class _CtxMenuRegionState extends State<CtxMenuRegion> {
  Offset? _longPressOffset;

  final ContextMenuController _contextMenuController = ContextMenuController();

  static bool get _longPressEnabled {
    switch (defaultTargetPlatform) {
      case .android:
      case .iOS:
        return true;
      case .macOS:
      case .fuchsia:
      case .linux:
      case .windows:
        return false;
    }
  }

  @override
  void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
  }

  @override
  void dispose() {
    _hide();
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    super.dispose();
  }

  void _onSecondaryTapUp(TapUpDetails details) {
    _show(details.globalPosition);
  }

  void _onTap() {
    if (!_contextMenuController.isShown) {
      return;
    }
    _hide();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    _longPressOffset = details.globalPosition;
  }

  void _onLongPress() {
    assert(_longPressOffset != null);
    _show(_longPressOffset!);
    _longPressOffset = null;
  }

  void _show(Offset position) {
    _contextMenuController.show(
      context: context,
      contextMenuBuilder: (BuildContext context) =>
          widget.menuBuilder?.call(context, position, widget.items) ??
          CtxMenu(
            offset: position,
            items: widget.items,
          ),
    );
  }

  void _hide() {
    _contextMenuController.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onSecondaryTapUp: _onSecondaryTapUp,
      onTap: _onTap,
      onLongPress: _longPressEnabled ? _onLongPress : null,
      onLongPressStart: _longPressEnabled ? _onLongPressStart : null,
      child: widget.child,
    );
  }
}
// AdaptiveTextSelectionToolbar(
//       anchors: TextSelectionToolbarAnchors(primaryAnchor: offset),
//       buttonItems: <ContextMenuButtonItem>[
//         ContextMenuButtonItem(
//           onPressed: () {
//             ContextMenuController.removeAny();
//             _showDialog(context);
//           },
//           label: 'Print',
//         ),
//         ContextMenuButtonItem(
//           type: .copy,
//           onPressed: () {
//             ContextMenuController.removeAny();
//             _showDialog(context);
//           },
//           label: 'Copy',
//         ),
//       ],
//     );

// import 'package:riv/presentation/presentation.dart' hide Divider;
// import 'package:flutter/material.dart';
// import 'package:riv/utils/utils.dart';

// class OverlayButton extends StatefulWidget {
//   const OverlayButton({super.key});

//   @override
//   State<OverlayButton> createState() => _OverlayButtonState();
// }

// class _OverlayButtonState extends State<OverlayButton>
//     with SingleTickerProviderStateMixin {
//   OverlayEntry? _overlayEntry;
//   bool isOpen = false;

//   Future<void> hideBottomOverlay() async {
//     setState(() => isOpen = false);
//     if (_overlayEntry == null) return;
//     _overlayEntry?.remove();
//     _overlayEntry = null;
//   }

//   void openOverlay() {
//     _overlayEntry = OverlayEntry(
//       builder: (context) {
//         return _ContextMenu(
//           layerLink: link,
//           closeOverlay: hideBottomOverlay,
//         );
//       },
//     );
//     setState(() => isOpen = true);
//     Overlay.of(context).insert(_overlayEntry!);
//   }

//   late final link = LayerLink();
//   @override
//   Widget build(BuildContext context) {
//     return CompositedTransformTarget(
//       link: link,
//       child: ElevatedButton(
//         onPressed: isOpen ? hideBottomOverlay : openOverlay,
//         child: Text(isOpen ? 'Pokaż' : "nie"),
//       ),
//     );
//   }
// }

// class _ContextMenu({
//   required final LayerLink layerLink,
//   required final VoidCallback closeOverlay,
// }) extends StatefulWidget {
//   @override
//   State<_ContextMenu> createState() => _ContextMenuState();
// }

// class _ContextMenuState extends State<_ContextMenu>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   late final CurvedAnimation _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.easeInSine,
//   );

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//       lowerBound: 0,
//       upperBound: 1,
//     )..animateTo(1);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animation.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   void hide() {
//     _controller.reverse(from: 1).then((_) => widget.closeOverlay());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final asd = Container(
//       padding: context.values.buttonPadding,
//       constraints: BoxConstraints(
//         maxWidth: 100,
//         maxHeight: MediaQuery.of(context).size.height,
//       ),
//       clipBehavior: .antiAlias,
//       decoration: BoxDecoration(
//         borderRadius: context.values.borderL,
//         boxShadow: context.palette.shadow,
//         color: context.appColors.bTonal.background,
//       ), //menu.boxDecoration ?? boxDecoration,
//       child: Material(
//         type: MaterialType.transparency,
//         child: IntrinsicWidth(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Expanded(
//                 child: ListView.separated(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   separatorBuilder: (context, index) => Divider(height: 1),
//                   itemBuilder: (_, _) => _ContextOption(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     // final asd = ConstrainedBox(
//     //   constraints: const BoxConstraints.tightFor(height: 500, width: 140),
//     //   child: ClipRRect(
//     //     borderRadius: context.values.borderXL,
//     //     child: Material(
//     //       child: ListView.separated(
//     //         itemCount: 10,
//     //         separatorBuilder: (context, index) => Divider(height: 1),
//     //         itemBuilder: (_, _) => _ContextOption(),
//     //       ),
//     //     ),
//     //   ),
//     // );

//     final anim = FadeTransition(
//       opacity: _animation,
//       child: asd,
//     );
//     // );
//     return Stack(
//       children: [
//         // kliknięcie poza dropdownem
//         Positioned.fill(
//           child: GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: hide,
//           ),
//         ),
//         CompositedTransformFollower(
//           link: widget.layerLink,
//           targetAnchor: Alignment.bottomRight,
//           followerAnchor: Alignment.topRight,
//           offset: const Offset(0, 8),
//           showWhenUnlinked: false,
//           child: anim,
//         ),
//       ],
//     );
//   }
// }

// class _ContextOption extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: .all(4),
//       alignment: .centerEnd,
//       decoration: BoxDecoration(
//         color: context.appColors.bTonal.background,
//       ),
//       child: Align(
//         child: Hover(
//           child: Text(
//             TextGen.nick(),
//             style: context.fonts.bodyStrong.withColor(
//               Color(0xff80e000),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class const Hover({
//   required final Widget child,
//   super.key,
// }) extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final hovered = useState(false);
//     print(hovered.value);
//     return InkWell(
//       onTap: () {},
//       onHover: hovered.set,
//       child: ColoredBox(
//         color: hovered.value
//             ? Color(0xffff0000)
//             : Color(0x0), // context.palette.getHover(hovered.value),
//         child: Listener(
//           onPointerHover: print,
//           child: child,
//         ),
//       ),
//     );
//     // return InkWell(
//     //   onTap: () {},
//     //   onHover: hovered.set,
//     //   child: ColoredBox(
//     //     child: child,
//     //   ),
//     // );
//   }
// }
// // Listener(
// //   onPointerHover: (event) => hovered.value = event,
// //   onTap: () {},
// //   onHover: hovered.set,
// //   child: child,
// // ),

// //       .wrapIf(
// //         true,
// //         (c) => CompositedTransformFollower(
// //           link: layerLink,
// //           targetAnchor: Alignment.bottomLeft,
// //           followerAnchor: Alignment.topLeft,
// //           offset: const Offset(0, 8),
// //           showWhenUnlinked: true,
// //           child: c,
// //         ),
// //       ),

// // );

// // ListTile(

// //   title: const Text('Opcja 1'),
// //   onTap: closeOverlay,
// // ),
// // ListTile(
// //   title: const Text('Opcja 2'),
// //   onTap: closeOverlay,
// // ),

// // class
