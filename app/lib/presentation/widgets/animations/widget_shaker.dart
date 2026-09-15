import 'dart:math' as math;

import 'package:riv/presentation/presentation.dart';

class const WidgetShaker({
  super.key,
  required final Widget child,
}) extends StatefulWidget {
  static WidgetShakerState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<WidgetShakerState>();

  static WidgetShakerState of(BuildContext context) => maybeOf(context)!;

  @override
  State<WidgetShaker> createState() => WidgetShakerState();
}

class WidgetShakerState extends State<WidgetShaker>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _shakeScreenAnimation =
      Tween<double>(begin: 0, end: math.pi * 20).animate(
        CurvedAnimation(
          parent: _shakeController,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        ),
      );

  late final AnimationController _shakeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );

  void shake() => _shakeController.forward(from: 0).then((_) {
    _shakeController.reset();
  });

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeScreenAnimation,
      builder: (context, child) {
        final val = _shakeScreenAnimation.value;
        return Transform.translate(
          offset: Offset.fromDirection(
            math.pi * math.cos(val),
            (math.sin(val)) * 100,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
