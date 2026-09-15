import 'package:flutter/material.dart' as m show showModalBottomSheet;
import 'package:riv/presentation/presentation.dart';

const double _kDefaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

Future<T?> showModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool? isScrollControlled,
  double scrollControlDisabledMaxHeightRatio =
      _kDefaultScrollControlDisabledMaxHeightRatio,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool? showDragHandle,
  bool? useSafeArea,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  Offset? anchorPoint,
  AnimationStyle? sheetAnimationStyle,
  bool? requestFocus,
  bool? runAwayFromKeyboard = true,
}) {
  final effectiveBuilder = runAwayFromKeyboard != true
      ? builder
      : (context) => SafeArea(
          child: Padding(
            padding: .only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Builder(builder: builder),
          ),
        );
  return m.showModalBottomSheet(
    context: context,
    builder: effectiveBuilder,
    backgroundColor: backgroundColor,
    barrierLabel: barrierLabel,
    elevation: elevation,
    shape: shape,
    clipBehavior: clipBehavior,
    constraints: constraints,
    barrierColor: barrierColor,
    isScrollControlled: isScrollControlled ?? runAwayFromKeyboard ?? false,
    scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    showDragHandle: showDragHandle,
    useSafeArea: useSafeArea ?? runAwayFromKeyboard ?? false,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
    sheetAnimationStyle: sheetAnimationStyle,
    requestFocus: requestFocus,
  );
}
