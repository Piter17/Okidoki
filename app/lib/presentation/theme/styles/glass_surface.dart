import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riv/presentation/presentation.dart';

class GlassSurface extends StatelessWidget {
  const GlassSurface({
    super.key,
    this.padding = const EdgeInsets.all(24),
    this.blur = 30,
    this.opacity = 0.12,
    this.borderOpacity = 0.25,
    required this.child,
  });

  final Widget child;
  final EdgeInsets padding;
  final double blur;
  final double opacity;
  final double borderOpacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(opacity),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(borderOpacity),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
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
