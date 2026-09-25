import 'package:riv/presentation/presentation.dart';

InputDecorationTheme getInputDecoration(ColorPalette colors, Values values) {
  // final font = fonts.labelRegular;

  // Color getColor(Set<WidgetState> states) {
  //   if (states.contains(WidgetState.disabled)) return colors.neutral200;
  //   if (states.contains(WidgetState.error)) return colors.alternativeY1;
  //   if (states.contains(WidgetState.focused)) return colors.core1;
  //   return colors.neutral400;
  // }

  return InputDecorationTheme(
    fillColor: WidgetStateColor.fromMap({
      WidgetState.disabled: colors.disabled,
      WidgetState.hovered: colors.hover,
      WidgetState.any: colors.tone,
    }),
    filled: true,
    border: UnderlineInputBorder(borderSide: .none),
    isCollapsed: false,

    // hintStyle: context.fonts.title1,
    // labelStyle: context.fonts.title1,
    // floatingLabelStyle: context.fonts.title1,
    // errorStyle: context.fonts.title1,
    // helperStyle: context.fonts.title1,
    // prefixStyle: context.fonts.title1,
    // suffixStyle: context.fonts.title1,
    // counterStyle: context.fonts.title1,
    //errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.alternativeY1)),
    // focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colors.alternativeY1, width: 2)),
    // hoverColor: colors.neutral700,
    // iconColor: colors.alternativeY1,
    // suffixIconColor: colors.alternativeY1,
    // labelStyle: WidgetStateTextStyle.resolveWith((x) {
    //   return font.withColor(getColor(x));
    // }),
    // helperStyle: WidgetStateTextStyle.resolveWith((x) {
    //   return x.contains(WidgetState.error) ? font.withColor(colors.alternativeY1) : font.withColor(colors.neutral200);
    // }),
    // errorStyle: fonts.labelRegular.withColor(colors.alternativeY1),
    contentPadding: values.textFieldPadding,
  );
}
