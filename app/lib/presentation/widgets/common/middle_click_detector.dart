import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:riv/presentation/presentation.dart';

class InputDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onLongPressUp;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;
  final VoidCallback? onSecondaryTap;
  final VoidCallback? onSecondaryTapDown;
  final VoidCallback? onSecondaryTapUp;
  final VoidCallback? onSecondaryTapCancel;

  final VoidCallback? onHover;
  final VoidCallback? onMiddleClick;

  final Widget Function(BuildContext context, bool isHovered)? builder;

  const new({
    super.key,
    this.onMiddleClick,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressUp,
    this.onTapDown,
    this.onTapUp,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onHover,
    this.builder,
    required this.child,
  });

  @override
  State<InputDetector> createState() => _InputDetectorState();
}

class _InputDetectorState extends State<InputDetector> {
  final _key = GlobalKey();
  int? _activePointer; // pointer id that began the “tap”
  bool _activeWasMiddle = false;

  bool _isEventInside(Offset globalPosition) {
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return false;
    final local = box.globalToLocal(globalPosition);
    return local.dx >= 0 &&
        local.dy >= 0 &&
        local.dx <= box.size.width &&
        local.dy <= box.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      // onPointerHover: (event) => event.,
      key: _key, // so we can compute bounds
      behavior: HitTestBehavior.opaque,
      onPointerDown: (event) {
        // Only middle mouse button
        final isMiddleMouseDown =
            event.kind == PointerDeviceKind.mouse &&
            (event.buttons & kMiddleMouseButton) != 0;

        if (!isMiddleMouseDown) return;

        _activePointer = event.pointer;
        _activeWasMiddle = true;
      },
      onPointerUp: (event) {
        if (_activePointer == null) return;
        if (event.pointer != _activePointer) return;

        final isMiddleMouseUp =
            event.kind == PointerDeviceKind.mouse &&
            (event.buttons ^ kMiddleMouseButton) == kMiddleMouseButton;

        if (!isMiddleMouseUp) return;

        final shouldFire = _activeWasMiddle && _isEventInside(event.position);

        _activePointer = null;
        _activeWasMiddle = false;

        if (shouldFire) {
          widget.onMiddleClick?.call();
        }
      },
      onPointerCancel: (event) {
        _activePointer = null;
        _activeWasMiddle = false;
      },
      child: widget.builder == null
          ? widget.child
          : widget.builder!(context, false),
    );
  }
}
