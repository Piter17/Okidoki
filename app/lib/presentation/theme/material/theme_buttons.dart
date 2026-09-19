import 'package:riv/presentation/presentation.dart';

class ThemeButtons {
  static ButtonStyle getButtonStyle(
    ThemeFonts fonts,
    ColorPalette colors,
    Values values,
  ) => ButtonStyle(
    minimumSize: WidgetStateProperty.all(const Size(0, 48)),
    maximumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
      return colors.primary;
    }),
    textStyle: WidgetStatePropertyAll(fonts.bodyStrong),
    alignment: Alignment.centerLeft,
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: values.border,
      ),
    ),
  );

  static TextButtonThemeData getTextButtonTheme(
    ThemeFonts fonts,
    ColorPalette colors,
    Values values,
  ) => TextButtonThemeData(style: getButtonStyle(fonts, colors, values));

  static FilledButtonThemeData getFilledButtonTheme(
    ThemeFonts fonts,
    ColorPalette colors,
    Values values,
  ) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
        maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return colors.tone;
          if (states.contains(WidgetState.pressed)) return colors.pressed;
          if (states.contains(WidgetState.focused)) return colors.focus;
          if (states.contains(WidgetState.hovered)) return colors.hover;
          return colors.primary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return colors.disabled;
          return colors.text;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return null;
          if (states.contains(WidgetState.pressed)) return colors.pressed;
          if (states.contains(WidgetState.focused)) return colors.focus;
          if (states.contains(WidgetState.hovered)) return colors.hover;
          return null;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: colors.border);
          }
          if (states.contains(WidgetState.focused)) {
            return BorderSide(color: colors.outline, width: 2);
          }
          return BorderSide(color: colors.border);
        }),
        elevation: const WidgetStatePropertyAll(0),
        padding: WidgetStatePropertyAll(values.buttonPadding),
        shape: WidgetStatePropertyAll(values.roundBorder),
      ),
    );
  }
}
