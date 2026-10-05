import 'package:okidoki/presentation/presentation.dart';

InputDecorationTheme getInputDecoration(ColorPalette colors, Values values) {
  return InputDecorationTheme(
    fillColor: WidgetStateColor.fromMap({
      WidgetState.disabled: colors.disabled,
      WidgetState.hovered: colors.hover,
      WidgetState.any: colors.tone,
    }),
    filled: true,
    border: UnderlineInputBorder(borderSide: .none),
    isCollapsed: false,
    contentPadding: values.textFieldPadding,
  );
}
