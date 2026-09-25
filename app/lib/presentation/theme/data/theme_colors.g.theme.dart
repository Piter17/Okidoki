// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'theme_colors.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeColors on ThemeExtension<ThemeColors> {
  @override
  ThemeExtension<ThemeColors> copyWith({
    Brightness? brightness,
    BackColorScheme? bPrimary,
    BackColorScheme? bSecondary,
    BackColorScheme? bPopup,
    BackColorScheme? bTonal,
    FrontColorScheme? primary,
    FrontColorScheme? secondary,
    FrontColorScheme? danger,
    FrontColorScheme? success,
    FrontColorScheme? warning,
    FrontColorScheme? info,
    Color? borderTranslucent,
    ColorPalette? defaultPalette,
  }) {
    final _this = (this as ThemeColors);

    return ThemeColors(
      brightness: brightness ?? _this.brightness,
      bPrimary: bPrimary ?? _this.bPrimary,
      bSecondary: bSecondary ?? _this.bSecondary,
      bPopup: bPopup ?? _this.bPopup,
      bTonal: bTonal ?? _this.bTonal,
      primary: primary ?? _this.primary,
      secondary: secondary ?? _this.secondary,
      danger: danger ?? _this.danger,
      success: success ?? _this.success,
      warning: warning ?? _this.warning,
      info: info ?? _this.info,
      borderTranslucent: borderTranslucent ?? _this.borderTranslucent,
      defaultPalette: defaultPalette ?? _this.defaultPalette,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    final _this = (this as ThemeColors);

    return ThemeColors(
      brightness: t < 0.5 ? _this.brightness : other.brightness,
      bPrimary: t < 0.5 ? _this.bPrimary : other.bPrimary,
      bSecondary: t < 0.5 ? _this.bSecondary : other.bSecondary,
      bPopup: t < 0.5 ? _this.bPopup : other.bPopup,
      bTonal: t < 0.5 ? _this.bTonal : other.bTonal,
      primary: t < 0.5 ? _this.primary : other.primary,
      secondary: t < 0.5 ? _this.secondary : other.secondary,
      danger: t < 0.5 ? _this.danger : other.danger,
      success: t < 0.5 ? _this.success : other.success,
      warning: t < 0.5 ? _this.warning : other.warning,
      info: t < 0.5 ? _this.info : other.info,
      borderTranslucent: Color.lerp(
        _this.borderTranslucent,
        other.borderTranslucent,
        t,
      )!,
      defaultPalette: t < 0.5 ? _this.defaultPalette : other.defaultPalette,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ThemeColors);
    final _other = (other as ThemeColors);

    return _other.brightness == _this.brightness &&
        _other.bPrimary == _this.bPrimary &&
        _other.bSecondary == _this.bSecondary &&
        _other.bPopup == _this.bPopup &&
        _other.bTonal == _this.bTonal &&
        _other.primary == _this.primary &&
        _other.secondary == _this.secondary &&
        _other.danger == _this.danger &&
        _other.success == _this.success &&
        _other.warning == _this.warning &&
        _other.info == _this.info &&
        _other.borderTranslucent == _this.borderTranslucent &&
        _other.defaultPalette == _this.defaultPalette;
  }

  @override
  int get hashCode {
    final _this = (this as ThemeColors);

    return Object.hash(
      runtimeType,
      _this.brightness,
      _this.bPrimary,
      _this.bSecondary,
      _this.bPopup,
      _this.bTonal,
      _this.primary,
      _this.secondary,
      _this.danger,
      _this.success,
      _this.warning,
      _this.info,
      _this.borderTranslucent,
      _this.defaultPalette,
    );
  }
}

extension ThemeColorsBuildContext on BuildContext {
  ThemeColors get appColors => Theme.of(this).extension<ThemeColors>()!;
}

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$ColorPalette {
  bool get canMerge => true;

  static ColorPalette? lerp(ColorPalette? a, ColorPalette? b, double t) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return ColorPalette._(
      primary: Color.lerp(a.primary, b.primary, t)!,
      text: Color.lerp(a.text, b.text, t)!,
      border: Color.lerp(a.border, b.border, t)!,
      disabled: Color.lerp(a.disabled, b.disabled, t)!,
      disabledBg: Color.lerp(a.disabledBg, b.disabledBg, t)!,
      pressed: Color.lerp(a.pressed, b.pressed, t)!,
      shadowColor: Color.lerp(a.shadowColor, b.shadowColor, t)!,
      hover: Color.lerp(a.hover, b.hover, t)!,
      focus: Color.lerp(a.focus, b.focus, t)!,
      outline: Color.lerp(a.outline, b.outline, t)!,
      background: Color.lerp(a.background, b.background, t)!,
      tone: Color.lerp(a.tone, b.tone, t)!,
      shadow: t < 0.5 ? a.shadow : b.shadow,
    );
  }

  ColorPalette copyWith({
    Color? primary,
    Color? text,
    Color? border,
    Color? disabled,
    Color? disabledBg,
    Color? pressed,
    Color? shadowColor,
    Color? hover,
    Color? focus,
    Color? outline,
    Color? background,
    Color? tone,
    List<BoxShadow>? shadow,
  }) {
    final _this = (this as ColorPalette);

    return ColorPalette._(
      primary: primary ?? _this.primary,
      text: text ?? _this.text,
      border: border ?? _this.border,
      disabled: disabled ?? _this.disabled,
      disabledBg: disabledBg ?? _this.disabledBg,
      pressed: pressed ?? _this.pressed,
      shadowColor: shadowColor ?? _this.shadowColor,
      hover: hover ?? _this.hover,
      focus: focus ?? _this.focus,
      outline: outline ?? _this.outline,
      background: background ?? _this.background,
      tone: tone ?? _this.tone,
      shadow: shadow ?? _this.shadow,
    );
  }

  ColorPalette merge(ColorPalette? other) {
    final _this = (this as ColorPalette);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      primary: other.primary,
      text: other.text,
      border: other.border,
      disabled: other.disabled,
      disabledBg: other.disabledBg,
      pressed: other.pressed,
      shadowColor: other.shadowColor,
      hover: other.hover,
      focus: other.focus,
      outline: other.outline,
      background: other.background,
      tone: other.tone,
      shadow: other.shadow,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other.runtimeType != runtimeType) {
      return false;
    }

    final _this = (this as ColorPalette);
    final _other = (other as ColorPalette);

    return _other.primary == _this.primary &&
        _other.text == _this.text &&
        _other.border == _this.border &&
        _other.disabled == _this.disabled &&
        _other.disabledBg == _this.disabledBg &&
        _other.pressed == _this.pressed &&
        _other.shadowColor == _this.shadowColor &&
        _other.hover == _this.hover &&
        _other.focus == _this.focus &&
        _other.outline == _this.outline &&
        _other.background == _this.background &&
        _other.tone == _this.tone &&
        _other.shadow == _this.shadow;
  }

  @override
  int get hashCode {
    final _this = (this as ColorPalette);

    return Object.hash(
      runtimeType,
      _this.primary,
      _this.text,
      _this.border,
      _this.disabled,
      _this.disabledBg,
      _this.pressed,
      _this.shadowColor,
      _this.hover,
      _this.focus,
      _this.outline,
      _this.background,
      _this.tone,
      _this.shadow,
    );
  }
}
