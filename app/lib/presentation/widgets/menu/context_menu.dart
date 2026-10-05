import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:okidoki/core/core.dart';
import 'package:okidoki/presentation/presentation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

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
    super.key,
    required this.child,
    required this.items,
  }) : menuBuilder = null;

  const CtxMenuRegion.custom({
    super.key,
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
