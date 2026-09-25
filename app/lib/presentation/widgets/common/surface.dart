import 'package:riv/presentation/presentation.dart';

class Surface({
  super.key,
  final SurfaceThemes? variant,
  final BorderRadius? borderRadius,
  final AlignmentGeometry? alignment,
  final EdgeInsetsGeometry? padding,
  final bool isAntiAlias = true,
  final BoxDecoration? decoration,
  final BoxDecoration? foregroundDecoration,
  final BoxConstraints? constraints,
  final EdgeInsetsGeometry? margin,
  final Matrix4? transform,
  final AlignmentGeometry? transformAlignment,
  final Clip clipBehavior = .none,
  final double? width,
  final double? height,
  final Widget? child,
}) extends StatefulWidget {
  this
    : assert(margin == null || margin.isNonNegative),
      assert(padding == null || padding.isNonNegative),
      assert(decoration == null || decoration.debugAssertIsValid()),
      assert(constraints == null || constraints.debugAssertIsValid()),
      assert(decoration != null || clipBehavior == Clip.none);

  static SurfaceState? of(BuildContext context) =>
      context.findAncestorStateOfType<SurfaceState>();

  @override
  State<Surface> createState() => SurfaceState();
}

class SurfaceState extends State<Surface> {
  // BoxDecoration getBoxDecoration(
  //   BuildContext context,
  //   BaseSurfaceStyle style,
  //   ColorPalette palette,
  // ) {
  //   return BoxDecoration(
  //     boxShadow: palette.shadow,
  //     borderRadius: widget.borderRadius ?? context.values.borderS,
  //     border: style is SurfaceStyle
  //         ? style.border
  //         : BoxBorder.all(
  //             color: palette.border,
  //             width: 3,
  //           ),
  //     color: palette.background,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final variant = widget.variant ?? .primary;
    final themes = context.surfaceTheme;
    final theme = themes.get(variant);

    final textColor = theme.text;
    final iconColor = theme.text;

    final decoration = BoxDecoration(
      boxShadow: theme.shadow,
      borderRadius: theme.borderRadius,
      color: theme.background,
    );

    final effectiveDecoration = widget.decoration;
    //  widget.decoration?.copyWithDecoration(
    decoration;
    // );

    return Container(
      alignment: widget.alignment,
      padding: widget.padding,
      isAntiAlias: widget.isAntiAlias,
      decoration: effectiveDecoration,
      foregroundDecoration: widget.foregroundDecoration,
      constraints: widget.constraints,
      margin: widget.margin,
      transform: widget.transform,
      transformAlignment: widget.transformAlignment,
      clipBehavior: widget.clipBehavior,
      width: widget.width,
      height: widget.height,
      child: widget.child != null
          ? IconTheme(
              data: IconThemeData(
                color: iconColor,
              ),
              child: DefaultTextStyle(
                style: context.fonts.body.withColor(textColor),
                child: widget.child!,
              ),
            )
          : null,
    );
  }
}

extension BoxDecorationExtensions on BoxDecoration {
  BoxDecoration copyWithDecoration(BoxDecoration newDecoration) => copyWith(
    color: newDecoration.color,
    image: newDecoration.image,
    border: newDecoration.border,
    borderRadius: newDecoration.borderRadius,
    boxShadow: newDecoration.boxShadow,
    gradient: newDecoration.gradient,
    backgroundBlendMode: newDecoration.backgroundBlendMode,
    shape: newDecoration.shape,
  );
}
