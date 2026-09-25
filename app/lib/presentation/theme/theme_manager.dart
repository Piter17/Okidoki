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
  final palette = colors.defaultPalette;
  final data = ThemeData(
    colorScheme: m.ColorScheme.fromSeed(
      seedColor: m.Colors.blue, //colors.primary.color,
      brightness: Brightness.dark,
      dynamicSchemeVariant: .vibrant,
    ),
    // textTheme: Typography.black,
    // fontFamily: FontFamily.redHatDisplay,
    // scaffoldBackgroundColor: palette.background,
    // switchTheme: switchStyle(context),
    // sliderTheme: sliderStyle(context),
    // dividerTheme: divider(context),
    // toggleButtonsTheme: ToggleButtonsThemeData(
    //   borderColor: colors.transparent,
    // ),
    // brightness: colors.brightness,

    useMaterial3: true,
    // switchTheme: getSwitchTheme(palette),
    // inputDecorationTheme: getInputDecoration(palette, values),
    // textTheme: m.TextTheme(
    //   // textEdit
    //   bodyLarge: fonts.bodyStronger,
    // ),
    filledButtonTheme: ThemeButtons.getFilledButtonTheme(
      fonts,
      palette,
      values,
    ),

    // outlinedButtonTheme: ThemeButtons.getOutlinedButtonTheme(colors),
    textButtonTheme: ThemeButtons.getTextButtonTheme(fonts, palette, values),
    // dialogTheme: .new(backgroundColor: colors.bPopup.background),
    // bottomSheetTheme: .new(
    //   backgroundColor: colors.bPopup.background,
    // ),
    extensions: [
      colors,
      SurfaceTheme(
        primary: SurfaceThemeVariant(
          background: colors.bPrimary.background,
          text: colors.bPrimary.text,
          // borderRadius: BorderRadius.all(.circular(16)),
          icon: colors.bPrimary.text,
          shadow: colors.bPrimary.shadow,
          debugLabel: SurfaceThemes.primary.name,
        ),
        secondary: SurfaceThemeVariant(
          background: colors.bSecondary.background,
          text: colors.bSecondary.text,
          borderRadius: BorderRadius.all(.circular(16)),
          // border: BoxBorder.all(color: colors.bSecondary.border, ),
          icon: colors.bSecondary.text,
          shadow: colors.bSecondary.shadow,
          debugLabel: SurfaceThemes.secondary.name,
        ),
        popup: SurfaceThemeVariant(
          background: colors.bPopup.background,
          text: colors.bPopup.text,
          borderRadius: BorderRadius.all(.circular(16)),
          icon: colors.bPopup.text,
          shadow: colors.bPopup.shadow,
          debugLabel: SurfaceThemes.popup.name,
        ),
      ),
    ],
  );
  return data;
}

extension ContextThemeX on BuildContext {
  ThemeValues get _t => ThemeValues.of(this);
  ThemeFonts get fonts => _t.fonts;
  Values get values => _t.values;

  ColorPalette get palette => appColors.defaultPalette;

  // ColorPalette get palette => appColors.resolve(this);

  Axis get flexDirection {
    final direction = findAncestorRenderObjectOfType<RenderFlex>()?.direction;

    if (direction == null) {
      throw "Missing RenderFlex parrent.";
    }

    return direction;
  }
}
