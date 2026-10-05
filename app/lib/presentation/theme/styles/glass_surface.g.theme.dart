// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'glass_surface.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$GlassThemeData on ThemeExtension<GlassThemeData> {
  @override
  ThemeExtension<GlassThemeData> copyWith({
    double? blur,
    double? opacity,
    double? borderOpacity,
  }) {
    final _this = (this as GlassThemeData);

    return GlassThemeData(
      blur: blur ?? _this.blur,
      opacity: opacity ?? _this.opacity,
      borderOpacity: borderOpacity ?? _this.borderOpacity,
    );
  }

  @override
  ThemeExtension<GlassThemeData> lerp(
    ThemeExtension<GlassThemeData>? other,
    double t,
  ) {
    if (other is! GlassThemeData) {
      return this;
    }

    final _this = (this as GlassThemeData);

    return GlassThemeData(
      blur: lerpDouble$(_this.blur, other.blur, t)!,
      opacity: lerpDouble$(_this.opacity, other.opacity, t)!,
      borderOpacity: lerpDouble$(_this.borderOpacity, other.borderOpacity, t)!,
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

    final _this = (this as GlassThemeData);
    final _other = (other as GlassThemeData);

    return _other.blur == _this.blur &&
        _other.opacity == _this.opacity &&
        _other.borderOpacity == _this.borderOpacity;
  }

  @override
  int get hashCode {
    final _this = (this as GlassThemeData);

    return Object.hash(
      runtimeType,
      _this.blur,
      _this.opacity,
      _this.borderOpacity,
    );
  }
}

extension GlassThemeDataBuildContext on BuildContext {
  GlassThemeData get glassTheme => Theme.of(this).extension<GlassThemeData>()!;
}
