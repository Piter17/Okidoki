import 'package:riv/presentation/presentation.dart';

class ThemeButtons {
  static TextButtonThemeData getTextButtonTheme(
    ThemeColors colors,
    Values values,
    ThemeFonts fonts,
  ) => TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(0, 48)),
      maximumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        return colors.primary.color;
      }),
      textStyle: WidgetStatePropertyAll(fonts.bodyStrong),
      alignment: Alignment.centerLeft,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: values.border,
        ),
      ),
    ),
  );

  static FilledButtonThemeData getFilledButtonTheme(
    ThemeColors colors,
    Values values,
  ) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(0, 40)),

        maximumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return colors.info.background;
          } else if (states.contains(WidgetState.pressed)) {
            return colors.border;
          }
          return colors.primary.color;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          // if (states.contains(WidgetState.disabled)) {
          //   return colors.neutral500;
          // } else if (states.contains(WidgetState.pressed)) {
          //   return colors.neutral800;
          // }
          return colors.body.color;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return Color(0x30000000);
          }
          return null;
        }),
        elevation: WidgetStateProperty.resolveWith<double>((_) => 0.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          values.roundBorder,
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          values.buttonPadding,
        ),
      ),
    );
  }
}
