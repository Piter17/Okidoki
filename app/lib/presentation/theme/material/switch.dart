import 'package:flutter/material.dart';
import 'package:riv/presentation/presentation.dart';

SwitchThemeData getSwitchTheme(ColorPalette colors) {
  Color resolveTrackColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return colors.disabled;
    if (states.contains(WidgetState.selected)) {
      if (states.contains(WidgetState.pressed)) return colors.pressed;
      if (states.contains(WidgetState.focused)) return colors.focus;
      if (states.contains(WidgetState.hovered)) return colors.hover;
      return colors.primary;
    }

    if (states.contains(WidgetState.pressed)) return colors.tone;
    if (states.contains(WidgetState.hovered)) return colors.hover;
    return colors.background;
  }

  Color resolveThumbColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return colors.tone;
    return states.contains(WidgetState.selected) ? colors.text : colors.text;
  }

  Color resolveOutlineColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) return colors.disabled;
    if (states.contains(WidgetState.selected)) return colors.border;
    if (states.contains(WidgetState.focused)) return colors.outline;
    return colors.border;
  }

  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(resolveThumbColor),
    trackColor: WidgetStateProperty.resolveWith(resolveTrackColor),
    trackOutlineColor: WidgetStateProperty.resolveWith(resolveOutlineColor),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return null;
      if (states.contains(WidgetState.pressed)) return colors.pressed;
      if (states.contains(WidgetState.focused)) return colors.focus;
      if (states.contains(WidgetState.hovered)) return colors.hover;
      return null;
    }),
    trackOutlineWidth: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.focused) ? 2 : 1,
    ),
  );
}
