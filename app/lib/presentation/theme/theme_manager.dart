import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:riv/providers/providers.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter/rendering.dart';

export 'package:riv/presentation/theme/data/typography.dart'
    show TextStyleExtensions;

class const ThemeManager({
  super.key,
  required final Widget child,
}) extends ConsumerStatefulWidget {
  @override
  ConsumerState<ThemeManager> createState() => ThemeManagerState();
}

class ThemeManagerState extends ConsumerState<ThemeManager> {
  late ThemeFonts fonts;
  late ThemeColors colors;
  late MarkdownStyleSheet markdownStyleSheet;
  late Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(appSettingsProvider);

    colors = ThemeColors.fromConfig(
      primaryColor: settings.color,
      backgroundColor: settings.darkMode
          ? Color(0xff212529)
          : Color(0xffdee2e6),
      transparency: 0.2,
    );

    final fonts = ThemeFonts(colors);
    final values = Values(LayoutType.fromContext(context) == LayoutType.phone);
    return ThemeValues(
      colors: colors,
      fonts: fonts,
      values: values,
      markdownStyleSheet: fonts.getMarkdownStyle(),
      child: Builder(
        builder: (context) => Theme(
          data: getTheme(context, fonts, colors, values),
          child: widget.child,
        ),
      ),
    );
  }
}

class ThemeValues extends InheritedWidget {
  const ThemeValues({
    super.key,
    required this.fonts,
    required this.colors,
    required this.values,
    required this.markdownStyleSheet,
    required super.child,
  });

  final ThemeFonts fonts;
  final ThemeColors colors;
  final Values values;

  ThemeFonts get f => fonts;
  ThemeColors get c => colors;
  Values get v => values;

  final MarkdownStyleSheet markdownStyleSheet;
  static ThemeValues of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeValues>()!;

  @override
  bool updateShouldNotify(covariant ThemeValues oldWidget) {
    return oldWidget.fonts != fonts ||
        oldWidget.colors != colors ||
        oldWidget.values != values ||
        oldWidget.markdownStyleSheet != markdownStyleSheet;
  }
}

ThemeData getTheme(
  BuildContext context,
  ThemeFonts fonts,
  ThemeColors colors,
  Values values,
) {
  final palette = colors.getPaletteOrDef();
  final data = ThemeData(
    colorScheme: m.ColorScheme.fromSeed(
      seedColor: colors.primary.color,
      brightness: colors.brightness,
    ),
    // textTheme: Typography.black,
    // fontFamily: FontFamily.redHatDisplay,
    useMaterial3: true,
    scaffoldBackgroundColor: palette.background,
    brightness: colors.brightness,
    switchTheme: getSwitchTheme(palette),
    // switchTheme: switchStyle(context),
    // sliderTheme: sliderStyle(context),
    // dividerTheme: divider(context),
    // toggleButtonsTheme: ToggleButtonsThemeData(
    //   borderColor: colors.transparent,
    // ),
    inputDecorationTheme: getInputDecoration(palette, values),
    textTheme: m.TextTheme(
      // textEdit
      bodyLarge: fonts.bodyStronger,
    ),
    filledButtonTheme: ThemeButtons.getFilledButtonTheme(
      fonts,
      palette,
      values,
    ),

    // outlinedButtonTheme: ThemeButtons.getOutlinedButtonTheme(colors),
    textButtonTheme: ThemeButtons.getTextButtonTheme(fonts, palette, values),
    dialogTheme: .new(backgroundColor: colors.bPopup.background),
    bottomSheetTheme: .new(
      backgroundColor: colors.bPopup.background,
    ),
    extensions: [
      colors,
    ],
  );
  return data;
}

extension ContextThemeX on BuildContext {
  ThemeValues get _t => ThemeValues.of(this);
  ThemeFonts get fonts => _t.fonts;
  Values get values => _t.values;

  ThemeColors get appColors => Theme.of(this).extension<ThemeColors>()!;
  ColorPalette get palette => appColors.resolve(this);

  // To Remove
  // SemanticsColor? get _s => SemanticsColor.of(this);
  // ColorPalette get palette => ColorPalette(
  //   foreground: (_s?.context ?? .primary).toColors(this),
  //   background: (_s?.surface ?? .body).toColors(this),
  // );

  Axis get flexDirection {
    final direction = findAncestorRenderObjectOfType<RenderFlex>()?.direction;

    if (direction == null) {
      throw "Missing RenderFlex parrent.";
    }

    return direction;
  }
}

// class ContextStyle extends StatelessWidget {
//   const new({
//     super.key,
//     required this.color,
//     required this.child,
//   });

//   final ContextColors color;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(data: getTheme(context, color), child: child);
//   }
// }
