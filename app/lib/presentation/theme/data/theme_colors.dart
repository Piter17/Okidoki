import 'package:flutter/foundation.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'theme_colors.g.theme.dart';

const _transparent = Color(0x00000000);
const _white = Color(0xffffffff);
const _black = Color(0xff000000);

enum FrontStyle { primary, success, info, warning, danger }

enum BackStyle { primary, secondary, popup, tonal }

enum FillType { background, border, context }

@ThemeGen(constructor: '_')
class ColorPalette with _$ColorPalette {
  final Color primary;
  final Color text;
  final Color border;
  final Color disabled;
  final Color disabledBg;
  final Color pressed;
  final Color shadowColor;
  final Color hover;
  final Color focus;
  final Color outline;
  final Color background;
  final Color tone;
  final List<BoxShadow> shadow;

  new _({
    required this.primary,
    required this.text,
    required this.border,
    required this.disabled,
    required this.disabledBg,
    required this.pressed,
    required this.shadowColor,
    required this.hover,
    required this.focus,
    required this.outline,
    required this.background,
    required this.tone,
    required this.shadow,
  });

  factory generate({
    required FrontColorScheme front,
    required BackColorScheme back,
  }) => ColorPalette._(
    primary: front.color,
    text: front.text,
    border: front.border,
    disabled: front.disabled,
    disabledBg: back.disabled,
    pressed: front.pressed,
    shadowColor: front.shadowColor,
    hover: front.hover,
    focus: front.focus,
    outline: front.outline,
    background: back.background,
    tone: back.tone,
    shadow: back.shadow,
  );

  Color getHover(bool isHover) => isHover ? hover : _transparent;
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
  final String? debugLabel,
}) with DiagnosticableTreeMixin {
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(StringProperty('debugLabel', debugLabel));
  }
}

class BackColorScheme({
  required final Color background, // główny kolor tła elementu
  required final Color tone, // główny kolor tła elementu
  required final Color text, // kolor tekstu/ikon na tle background

  required final Color disabled, // zablokowane
  required final Color border, // ramki, separatory
  required final Color shadowColor, // cienie i głębia
  required final Color hover, // stan hover
  required final List<BoxShadow> shadow,
  final String? debugLabel,
}) with DiagnosticableTreeMixin {
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
      disabled: color.relight(.05, .05),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(StringProperty('debugLabel', debugLabel));
  }
}

@ThemeExtensions(contextAccessorName: 'appColors')
class ThemeColors extends ThemeExtension<ThemeColors> with _$ThemeColors {
  new({
    required this.brightness,
    required this.bPrimary,
    required this.bSecondary,
    required this.bPopup,
    required this.bTonal,
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.success,
    required this.warning,
    required this.info,
    required this.borderTranslucent,
    required this.defaultPalette,
  });

  final Brightness brightness;
  final BackColorScheme bPrimary;
  final BackColorScheme bSecondary;
  final BackColorScheme bPopup;
  final BackColorScheme bTonal;
  final FrontColorScheme primary;
  final FrontColorScheme secondary;
  final FrontColorScheme danger;
  final FrontColorScheme success;
  final FrontColorScheme warning;
  final FrontColorScheme info;
  final Color borderTranslucent;

  final ColorPalette defaultPalette;

  @ignore
  final Color white = _white;
  @ignore
  final Color black = _black;
  @ignore
  final Color transparent = _transparent;

  factory fromConfig({
    required Color primaryColor,
    required Color backgroundColor,
    required double transparency,
  }) {
    final secondaryBg = backgroundColor.relight(.2, .1);
    final popup = backgroundColor.relight(.1, .2);

    final bb = BackColorScheme.generate(backgroundColor);
    final ff = FrontColorScheme.generate(primaryColor);
    return ThemeColors(
      borderTranslucent: _black.withValues(alpha: transparency),
      bPrimary: .generate(backgroundColor),
      bSecondary: .generate(secondaryBg),
      bPopup: .generate(popup),
      bTonal: .generate(popup),
      brightness: backgroundColor.brightness,
      primary: .generate(primaryColor),
      secondary: .generate(primaryColor.lighten(.3)),
      danger: .generate(const Color(0xFFD32F2F)),
      success: .generate(const Color(0xFF388E3C)),
      warning: .generate(const Color(0xFFFBC02D)),
      info: .generate(const Color(0xFF1976D2)),
      defaultPalette: .generate(front: ff, back: bb),
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

  Color desaturate(double amount) {
    final hsl = HSLColor.fromColor(this);
    final desaturated = hsl.withSaturation(
      (hsl.saturation - amount).clamp(0.0, 1.0),
    );
    return desaturated.toColor();
  }
}
