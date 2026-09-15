import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riv/presentation/presentation.dart';

class InsertNewlineIntent extends Intent {
  const InsertNewlineIntent();
}

class EnterIntent extends Intent {
  const EnterIntent();
}

class ShowGotoIntent extends Intent {
  const ShowGotoIntent();
}

class ShowGotoAction extends CallbackAction<ShowGotoIntent> {
  ShowGotoAction() : super(onInvoke: _invoke);

  static Object? _invoke(ShowGotoIntent intent) {
    // TODO Add jumpto popup
    debugPrint("Show goto");
    return null;
  }
}

class AppShortcuts extends StatelessWidget {
  final Widget child;

  const new({
    super.key,
    required this.child,
  });

  static const _shortcuts = <ShortcutActivator, Intent>{
    SingleActivator(
      LogicalKeyboardKey.enter,
      shift: true,
    ): InsertNewlineIntent(),
    SingleActivator(
      LogicalKeyboardKey.enter,
    ): EnterIntent(),
    SingleActivator(
      LogicalKeyboardKey.keyT,
      control: true,
    ): ShowGotoIntent(),
  };

  static const _appleShortcuts = <ShortcutActivator, Intent>{
    SingleActivator(
      LogicalKeyboardKey.enter,
      shift: true,
    ): InsertNewlineIntent(),
    SingleActivator(
      LogicalKeyboardKey.enter,
    ): EnterIntent(),
    SingleActivator(
      LogicalKeyboardKey.keyT,
      meta: true,
    ): ShowGotoIntent(),
  };

  static Map<ShortcutActivator, Intent> get shorts =>
      switch (defaultTargetPlatform) {
        TargetPlatform.android ||
        TargetPlatform.fuchsia ||
        TargetPlatform.linux ||
        TargetPlatform.windows => _shortcuts,
        TargetPlatform.macOS || TargetPlatform.iOS => _appleShortcuts,
      };

  @override
  Widget build(BuildContext context) {
    final keys = switch (defaultTargetPlatform) {
      TargetPlatform.android ||
      TargetPlatform.fuchsia ||
      TargetPlatform.linux ||
      TargetPlatform.windows => _shortcuts,
      TargetPlatform.macOS || TargetPlatform.iOS => _appleShortcuts,
    };
    final effectiveShortcuts = <ShortcutActivator, Intent>{
      ...WidgetsApp.defaultShortcuts,
      ...keys,
    };

    // return child;
    return Shortcuts(shortcuts: effectiveShortcuts, child: child);
  }
}
