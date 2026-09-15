import 'package:flutter/widgets.dart' as w show LayoutBuilder;
import 'package:riv/presentation/presentation.dart';
import 'package:riv/utils/utils.dart';

typedef LayoutChangedCallback = void Function(
  LayoutType oldLayout,
  LayoutType newLayout,
);

typedef AdaptiveBuilder = Widget Function(
  BuildContext context,
  LayoutType layoutType,
  bool isPhone,
);

enum LayoutType {
  phone,
  tablet,
  desktop;

  bool operator <(LayoutType other) => index < other.index;
  bool operator >(LayoutType other) => index > other.index;
  bool operator <=(LayoutType other) => index <= other.index;
  bool operator >=(LayoutType other) => index >= other.index;

  static LayoutType fromWidth(double width) => switch (width) {
    < 500 => LayoutType.phone,
    < 800 => LayoutType.tablet,
    _ => LayoutType.desktop,
  };

  static LayoutType fromContext(BuildContext context) =>
      fromWidth(MediaQuery.sizeOf(context).width);
}

class LayoutBuilder extends StatefulWidget {
  final AdaptiveBuilder? adaptiveBuilder;
  final Widget Function(BuildContext context, BoxConstraints constraints)?
  builder;
  final LayoutChangedCallback? layoutChangedCallback;

  const new({
    super.key,
    required AdaptiveBuilder? builder,
    this.layoutChangedCallback,
  }) : adaptiveBuilder = builder,
       builder = null;

  const new constraints({
    super.key,
    required this.builder,
    this.layoutChangedCallback,
  }) : adaptiveBuilder = null;

  @override
  State<LayoutBuilder> createState() => LayoutBuilderState();
}

class LayoutBuilderState extends State<LayoutBuilder> {
  LayoutType? lastLayout;

  void _layoutChanged(LayoutType oldLayout, LayoutType newLayout) {
    widget.layoutChangedCallback?.call(oldLayout, newLayout);
  }

  @override
  Widget build(BuildContext context) {
    return w.LayoutBuilder(
      builder: widget.builder != null
          ? widget.builder!
          : (context, constraints) {
              var newLayout = LayoutType.fromWidth(constraints.maxWidth);
              if (lastLayout == null) {
                lastLayout = newLayout;
              } else {
                if (lastLayout != newLayout) {
                  _layoutChanged(lastLayout!, newLayout);
                  lastLayout = newLayout;
                }
              }

              return widget.adaptiveBuilder!.call(
                context,
                newLayout,
                DeviceUtils.isPhone,
              );
            },
    );
  }
}
