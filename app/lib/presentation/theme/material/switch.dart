import 'package:flutter/material.dart';
import 'package:riv/presentation/presentation.dart';

SwitchThemeData getSwitchTheme(BuildContext context) => SwitchThemeData(
  thumbColor: WidgetStateColor.fromMap({
    WidgetState.disabled: context.colors.light.color.mixMain(30, 30),
    WidgetState.any: context.colors.light.color,
  }),
  trackColor: WidgetStateColor.fromMap({
    WidgetState.selected & WidgetState.disabled: context.colors.primary.color
        .mixMain(
          20,
          20,
        ),
    WidgetState.selected: context.colors.primary.color,
    WidgetState.any: context.colors.transparent,
  }),
  trackOutlineColor: WidgetStateColor.fromMap({
    WidgetState.any: context.colors.light.border,
  }),
  overlayColor: WidgetStateColor.fromMap({
    WidgetState.any: context.colors.primary.color,
  }),
  trackOutlineWidth: WidgetStateProperty.fromMap({
    WidgetState.error | WidgetState.hovered | WidgetState.focused: 5,
    ~WidgetState.disabled: 2,
    WidgetState.any: 1,
  }),
  thumbIcon: WidgetStateProperty.fromMap({
    ~WidgetState.selected: Icon(Icons.close),
    WidgetState.selected: Icon(Icons.check),
  }),
  // padding : ,
);
