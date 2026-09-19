import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:stack_trace/stack_trace.dart';

part 'theme_colors.g.dart';

const _transparent = Color(0x00000000);
const _white = Color(0xffffffff);
const _black = Color(0xff000000);

class const SemanticsColor({
  super.key,
  required super.child,
  required final FrontStyle context,
  required final BackStyle surface,
  required final FillType fillType,
}) extends InheritedWidget {
  static SemanticsColor? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SemanticsColor>();

  @override
  bool updateShouldNotify(covariant SemanticsColor oldWidget) =>
      oldWidget.context != context && oldWidget.surface != surface;
}

enum FrontStyle { primary, success, info, warning, danger }

enum BackStyle { primary, secondary, popup, tonal }

enum FillType {
  background,
  border,
  context;

  T map<T>(T def, {T? background, T? border, T? context}) => switch (this) {
    .background => background ?? def,
    .border => border ?? def,
    .context => context ?? def,
  };
}

@CopyWith(constructor: "_")
class ColorPalette._({
  required final Color primary,
  required final Color text,
  required final Color border,
  required final Color disabled,
  required final Color pressed,
  required final Color shadowColor,
  required final Color hover,
  required final Color focus,
  required final Color outline,
  required final Color background,
  required final Color tone,
  required final List<BoxShadow> shadow,
}) {
  factory generate({
    required FrontColorScheme front,
    required BackColorScheme back,
    required FillType fillType,
  }) => switch (fillType) {
    FillType.background => _default(front, back),
    FillType.border => _default(front, back).copyWith(
      background: _transparent,
      border: front.border,
    ),
    FillType.context => _default(
      front,
      back,
    ).copyWith(background: front.color, text: front.text),
  };

  Color getHover(bool isHover) => isHover ? hover : _transparent;

  static ColorPalette _default(
    FrontColorScheme front,
    BackColorScheme back,
  ) => ColorPalette._(
    primary: front.color,
    text: front.text,
    border: front.border,
    disabled: front.disabled,
    pressed: front.pressed,
    shadowColor: front.shadowColor,
    hover: front.hover,
    focus: front.focus,
    outline: front.outline,
    background: back.background,
    tone: back.tone,
    shadow: back.shadow,
  );
}

class FrontColorScheme({
  required final Color color, // główny kolor tła elementu
  required final Color text, // kolor tekstu/ikon na tle background
  required final Color border, // ramki, separatory
  required final Color disabled, // nieaktywne elementy
  required final Color pressed, // wciśnięte elementy
  required final Color shadowColor, // cienie i głębia
  required final Color hover, // stan hover
  required final Color focus, // stan focus
  required final Color outline, // kontury np. inputów
  required final List<BoxShadow> shadow,
}) {
  factory generate(Color color) {
    final textColor = color.isDark ? _white : _black;
    final shadowColor = color.isDark
        ? _black.withValues(alpha: 0.3)
        : _black.withValues(alpha: 0.1);

    return FrontColorScheme(
      color: color,
      text: textColor,
      border: textColor.withValues(alpha: 0.2),
      disabled: textColor.withValues(alpha: 0.4),
      pressed: color.isDark ? color.darken(0.2) : color.lighten(0.2),
      shadowColor: color.isDark
          ? _black.withValues(alpha: 0.3)
          : _black.withValues(alpha: 0.1),
      hover: color.isDark ? color.lighten(0.1) : color.darken(0.1),
      focus: color.isDark ? color.lighten(0.15) : color.darken(0.15),
      outline: textColor.withValues(alpha: 0.3),
      shadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ],
    );
  }
}

class BackColorScheme({
  required final Color background, // główny kolor tła elementu
  required final Color tone, // główny kolor tła elementu
  required final Color text, // kolor tekstu/ikon na tle background
  required final Color border, // ramki, separatory
  required final Color shadowColor, // cienie i głębia
  required final Color hover, // stan hover
  required final List<BoxShadow> shadow,
}) {
  factory generate(Color color) {
    final textColor = color.isDark == false ? _black : _white;
    final shadowColor = color.isDark
        ? _black.withValues(alpha: 0.3)
        : _black.withValues(alpha: 0.1);

    return BackColorScheme(
      background: color,
      text: textColor,
      tone: color.relight(.2, .2),
      border: textColor.withValues(alpha: 0.2),
      shadowColor: shadowColor,
      hover: color.relight(.15, .15),
      shadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ],
    );
  }
}

class ThemeColors({
  required final Brightness brightness,
  required final BackColorScheme bPrimary,
  required final BackColorScheme bSecondary,
  required final BackColorScheme bPopup,
  required final BackColorScheme bTonal,
  required final FrontColorScheme primary,
  required final FrontColorScheme secondary,
  required final FrontColorScheme danger,
  required final FrontColorScheme success,
  required final FrontColorScheme warning,
  required final FrontColorScheme info,
  required final Color borderTranslucent,
}) extends ThemeExtension<ThemeColors> {
  final Color white = _white;
  final Color black = _black;
  final Color transparent = _transparent;
  final Map<SurfacePalette, ColorPalette> _cache = {};

  factory fromConfig({
    required Color primaryColor,
    required Color backgroundColor,
    required double transparency,
  }) {
    final tonal = backgroundColor.relight(.1, .1);
    final secondaryBg = backgroundColor.relight(.1, .1);
    final popup = backgroundColor.relight(.1, .1);
    return ThemeColors(
      borderTranslucent: _black.withValues(alpha: transparency),
      bPrimary: .generate(backgroundColor),
      bSecondary: .generate(secondaryBg),
      bPopup: .generate(tonal),
      bTonal: .generate(popup),
      brightness: backgroundColor.brightness,
      primary: .generate(primaryColor),
      secondary: .generate(primaryColor.lighten(.3)),
      danger: .generate(const Color(0xFFD32F2F)),
      success: .generate(const Color(0xFF388E3C)),
      warning: .generate(const Color(0xFFFBC02D)),
      info: .generate(const Color(0xFF1976D2)),
    );
  }

  FrontColorScheme getFront(FrontStyle front) => switch (front) {
    .primary => primary,
    .success => success,
    .info => info,
    .warning => warning,
    .danger => danger,
  };

  BackColorScheme getBack(BackStyle back) => switch (back) {
    .primary => bPrimary,
    .secondary => bSecondary,
    .popup => bPopup,
    .tonal => bTonal,
  };

  @override
  ThemeExtension<ThemeColors> copyWith() => this;

  @override
  ThemeExtension<ThemeColors> lerp(
    covariant ThemeExtension<ThemeColors>? other,
    double t,
  ) => this;

  final _default = SurfacePalette();

  ColorPalette getPaletteOrDef({
    FrontStyle? foreground,
    BackStyle? background,
    FillType? fill,
  }) => getPalette(
    SurfacePalette(
      foreground: foreground ?? _default.foreground,
      background: background ?? _default.background,
      fill: fill ?? _default.fill,
    ),
  );

  ColorPalette getPalette(SurfacePalette style) {
    final ownFrames = Trace.current().frames.where(
      (frame) => frame.uri.toString().startsWith('package:riv/'),
    );

    final stack = Trace(ownFrames);

    debugPrint("getpalette: $style\n$stack");

    return _cache.putIfAbsent(
      style,
      () => ColorPalette.generate(
        front: getFront(style.foreground),
        back: getBack(style.background),
        fillType: style.fill,
      ),
    );
  }

  ColorPalette resolve(BuildContext context) {
    final style = Surface.of(context)?.style;
    return getPalette(style is SurfacePalette ? style : const SurfacePalette());
  }
}

extension ColorX on Color {
  bool get isDark => computeLuminance() < .5;
  Brightness get brightness => isDark ? .dark : .light;

  Color relight(double sub, double add) => isDark ? lighten(add) : darken(sub);
  Color withTransparency(double dark, double light) =>
      withValues(alpha: isDark ? dark : light);

  Color lighten(double amount) {
    final hsl = HSLColor.fromColor(this);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }

  Color darken(double amount) {
    final hsl = HSLColor.fromColor(this);
    final darkened = hsl.withLightness(
      (hsl.lightness - amount).clamp(0.0, 1.0),
    );
    return darkened.toColor();
  }
}

// factory ThemeColors.light([Color primaryColor = const Color(0xff0d6efd)]) =>
//     ThemeColors._internal(
//       brightness: Brightness.light,
//       body: ColorSet(
//         Color(0xff212529),
//         Color(0xffffffff),
//         Color(0xffdee2e6),
//       ),
//       secondary: ColorSet(
//         Color(0xbf212529),
//         Color(0xffe9ecef),
//         Color(0xffdee2e6),
//       ),
//       tertiary: ColorSet(
//         Color(0x80212529),
//         Color(0xfff8f9fa),
//         Color(0xffdee2e6),
//       ),
//       emphasis: Color(0xff000000),
//       border: Color(0xffdee2e6),
//       borderTranslucent: Color(0x2d000000),
//       primary: ColorSet(
//         primaryColor,
//         Color(0xffcfe2ff),
//         Color(0xff9ec5fe),
//         Color(0xff052c65),
//       ),
//       // primary: ColorSet(
//       //   Color(0xff0d6efd),
//       //   Color(0xffcfe2ff),
//       //   Color(0xff9ec5fe),
//       //   Color(0xff052c65),
//       // ),
//       success: ColorSet(
//         Color(0xff198754),
//         Color(0xffd1e7dd),
//         Color(0xffa3cfbb),
//         Color(0xff2b2f32),
//       ),
//       info: ColorSet(
//         Color(0xff0dcaf0),
//         Color(0xffcff4fc),
//         Color(0xff9eeaf9),
//         Color(0xff055160),
//       ),
//       warrning: ColorSet(
//         Color(0xffffc107),
//         Color(0xfffff3cd),
//         Color(0xffffe69c),
//         Color(0xff664d03),
//       ),
//       danger: ColorSet(
//         Color(0xffdc3545),
//         Color(0xfff8d7da),
//         Color(0xfff8d7da),
//         Color(0xff58151c),
//       ),
//       light: ColorSet(
//         Color(0xfff8f9fa),
//         Color(0xfffcfcfd),
//         Color(0xffe9ecef),
//         Color(0xff495057),
//       ),
//       dark: ColorSet(
//         Color(0xff212529),
//         Color(0xffced4da),
//         Color(0xffadb5bd),
//         Color(0xff495057),
//       ),
//       shadow: [
//         BoxShadow(
//           color: Color(0x20000000),
//           blurRadius: 15,
//           spreadRadius: 1,
//         ),
//       ],
//     );

// factory ThemeColors.dark([Color primaryColor = const Color(0xff0d6efd)]) =>
//     ThemeColors._internal(
//       brightness: Brightness.dark,
//       body: ColorSet(Color(0xffdee2e6), Color(0xff212529), Color(0xff495057)),
//       secondary: ColorSet(
//         Color(0xbfdee2e6),
//         Color(0xff343a40),
//         Color(0xff495057),
//       ),
//       tertiary: ColorSet(
//         Color(0x80dee2e6),
//         Color(0xff2b3035),
//         Color(0xff495057),
//       ),
//       emphasis: Color(0xff000000),
//       border: Color(0xff495057),
//       borderTranslucent: Color(0x26ffffff),
//       // primary: ColorSet(
//       //   Color(0xff0d6efd),
//       //   Color(0xff031633),
//       //   Color(0xff084298),
//       //   Color(0xff6ea8fe),
//       // ),
//       primary: ColorSet(
//         primaryColor,
//         Color(0xff031633),
//         Color(0xff084298),
//         Color(0xff6ea8fe),
//       ),
//       success: ColorSet(
//         Color(0xff198754),
//         Color(0xff051b11),
//         Color(0xff0f5132),
//         Color(0xff75b798),
//       ),
//       info: ColorSet(
//         Color(0xff0dcaf0),
//         Color(0xff032830),
//         Color(0xff087990),
//         Color(0xff6edff6),
//       ),
//       warrning: ColorSet(
//         Color(0xffffc107),
//         Color(0xff332701),
//         Color(0xff997404),
//         Color(0xffffda6a),
//       ),
//       danger: ColorSet(
//         Color(0xffdc3545),
//         Color(0xff2c0b0e),
//         Color(0xff842029),
//         Color(0xffea868f),
//       ),
//       light: ColorSet(
//         Color(0xfff8f9fa),
//         Color(0xff343a40),
//         Color(0xff495057),
//         Color(0xfff8f9fa),
//       ),
//       dark: ColorSet(
//         Color(0xff212529),
//         Color(0xff1a1d20),
//         Color(0xff343a40),
//         Color(0xffdee2e6),
//       ),
//       shadow: [
//         BoxShadow(
//           color: Color(0x20FFFFFF),
//           blurRadius: 15,
//           spreadRadius: 1,
//         ),
//       ],
//     );
