import 'package:flutter/foundation.dart';
import 'package:riv/presentation/presentation.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'surface_theme.g.theme.dart';

@ThemeExtensions()
class SurfaceTheme extends ThemeExtension<SurfaceTheme> with _$SurfaceTheme {
  final SurfaceThemeVariant primary;
  final SurfaceThemeVariant secondary;
  final SurfaceThemeVariant popup;

  new({
    required this.primary,
    required this.secondary,
    required this.popup,
  });

  SurfaceThemeVariant get(SurfaceThemes variant) => switch (variant) {
    SurfaceThemes.primary => primary,
    SurfaceThemes.secondary => secondary,
    SurfaceThemes.popup => popup,
  };
}

enum SurfaceThemes {
  primary,
  secondary,
  popup,
}

@ThemeGen()
class SurfaceThemeVariant with DiagnosticableTreeMixin, _$SurfaceThemeVariant {
  final Color background;
  final Color text;
  final Color icon;
  final List<BoxShadow>? shadow;
  final BorderRadius? borderRadius;
  final String? debugLabel;

  new({
    required this.background,
    required this.text,
    this.borderRadius,
    Color? icon,
    this.shadow,
    this.debugLabel,
  }) : icon = icon ?? text;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(StringProperty('debugLabel', debugLabel));
  }
}
