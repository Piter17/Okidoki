import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'glass_surface.g.theme.dart';

@ThemeExtensions(contextAccessorName: 'glassTheme')
class GlassThemeData extends ThemeExtension<GlassThemeData>
    with _$GlassThemeData {
  final double blur;
  final double opacity;
  final double borderOpacity;

  GlassThemeData({
    required this.blur,
    required this.opacity,
    required this.borderOpacity,
  });

  factory GlassThemeData.light() => GlassThemeData(
    blur: 10,
    opacity: 0.6,
    borderOpacity: 0.8,
  );
  factory GlassThemeData.dark() => GlassThemeData(
    blur: 10,
    opacity: 0.18,
    borderOpacity: 0.35,
  );
}

class const GlassSurface({
  super.key,
  final double? _blur,
  final double? _opacity,
  final double? _borderOpacity,
  required final bool asDialog,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blur = _blur ?? context.glassTheme.blur;
    final opacity = _opacity ?? context.glassTheme.opacity;
    final borderOpacity = _borderOpacity ?? context.glassTheme.borderOpacity;
    final borderRadius = asDialog
        ? BorderRadius.circular(20)
        : BorderRadius.vertical(top: Radius.circular(20));
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface
                .withValues(alpha: opacity),
            borderRadius: borderRadius,
            border: Border.all(
              color: Colors.white.withValues(alpha: borderOpacity),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 40,
                spreadRadius: -4,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
