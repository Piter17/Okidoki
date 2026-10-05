// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'surface_theme.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$SurfaceTheme on ThemeExtension<SurfaceTheme> {
  @override
  ThemeExtension<SurfaceTheme> copyWith({
    SurfaceThemeVariant? primary,
    SurfaceThemeVariant? secondary,
    SurfaceThemeVariant? popup,
  }) {
    final _this = (this as SurfaceTheme);

    return SurfaceTheme(
      primary: primary ?? _this.primary,
      secondary: secondary ?? _this.secondary,
      popup: popup ?? _this.popup,
    );
  }

  @override
  ThemeExtension<SurfaceTheme> lerp(
    ThemeExtension<SurfaceTheme>? other,
    double t,
  ) {
    if (other is! SurfaceTheme) {
      return this;
    }

    final _this = (this as SurfaceTheme);

    return SurfaceTheme(
      primary: t < 0.5 ? _this.primary : other.primary,
      secondary: t < 0.5 ? _this.secondary : other.secondary,
      popup: t < 0.5 ? _this.popup : other.popup,
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

    final _this = (this as SurfaceTheme);
    final _other = (other as SurfaceTheme);

    return _other.primary == _this.primary &&
        _other.secondary == _this.secondary &&
        _other.popup == _this.popup;
  }

  @override
  int get hashCode {
    final _this = (this as SurfaceTheme);

    return Object.hash(
      runtimeType,
      _this.primary,
      _this.secondary,
      _this.popup,
    );
  }
}

extension SurfaceThemeBuildContext on BuildContext {
  SurfaceTheme get surfaceTheme => Theme.of(this).extension<SurfaceTheme>()!;
}

// **************************************************************************
// ThemeGenGenerator
// **************************************************************************

mixin _$SurfaceThemeVariant {
  bool get canMerge => true;

  static SurfaceThemeVariant? lerp(
    SurfaceThemeVariant? a,
    SurfaceThemeVariant? b,
    double t,
  ) {
    if (identical(a, b)) {
      return a;
    }

    if (a == null) {
      return t == 1.0 ? b : null;
    }

    if (b == null) {
      return t == 0.0 ? a : null;
    }

    return SurfaceThemeVariant(
      background: Color.lerp(a.background, b.background, t)!,
      text: Color.lerp(a.text, b.text, t)!,
      icon: Color.lerp(a.icon, b.icon, t)!,
      shadow: t < 0.5 ? a.shadow : b.shadow,
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      debugLabel: t < 0.5 ? a.debugLabel : b.debugLabel,
    );
  }

  SurfaceThemeVariant copyWith({
    Color? background,
    Color? text,
    Color? icon,
    List<BoxShadow>? shadow,
    BorderRadius? borderRadius,
    String? debugLabel,
  }) {
    final _this = (this as SurfaceThemeVariant);

    return SurfaceThemeVariant(
      background: background ?? _this.background,
      text: text ?? _this.text,
      icon: icon ?? _this.icon,
      shadow: shadow ?? _this.shadow,
      borderRadius: borderRadius ?? _this.borderRadius,
      debugLabel: debugLabel ?? _this.debugLabel,
    );
  }

  SurfaceThemeVariant merge(SurfaceThemeVariant? other) {
    final _this = (this as SurfaceThemeVariant);

    if (other == null || identical(_this, other)) {
      return _this;
    }

    if (!other.canMerge) {
      return other;
    }

    return copyWith(
      background: other.background,
      text: other.text,
      icon: other.icon,
      shadow: other.shadow,
      borderRadius: other.borderRadius,
      debugLabel: other.debugLabel,
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

    final _this = (this as SurfaceThemeVariant);
    final _other = (other as SurfaceThemeVariant);

    return _other.background == _this.background &&
        _other.text == _this.text &&
        _other.icon == _this.icon &&
        _other.shadow == _this.shadow &&
        _other.borderRadius == _this.borderRadius &&
        _other.debugLabel == _this.debugLabel;
  }

  @override
  int get hashCode {
    final _this = (this as SurfaceThemeVariant);

    return Object.hash(
      runtimeType,
      _this.background,
      _this.text,
      _this.icon,
      _this.shadow,
      _this.borderRadius,
      _this.debugLabel,
    );
  }
}
