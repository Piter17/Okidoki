import 'package:riv/presentation/presentation.dart';

sealed class BaseSurfaceStyle;

class const SurfacePalette({
  final FrontStyle foreground = .primary,
  final BackStyle background = .primary,
  final FillType fill = .background,
}) implements BaseSurfaceStyle {
  // ColorPalette resolve(BuildContext context) =>
  //     context.appColors.resolve(this);

  @override
  String toString() => [
    foreground.name,
    background.name,
    fill.name,
  ].join(', ');
}

class const SurfaceStyle({
  super.foreground,
  super.background,
  super.fill,
  final BoxBorder? border,
}) extends SurfacePalette {
  factory fromPalette(SurfacePalette e) => SurfaceStyle(
    foreground: e.foreground,
    background: e.background,
    fill: e.fill,
  );
}

class Surface extends StatefulWidget {
  Surface({
    this.surfaceStyle,
    super.key,
    this.borderRadius,
    this.alignment,
    this.padding,
    this.isAntiAlias = true,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  }) : assert(margin == null || margin.isNonNegative),
       assert(padding == null || padding.isNonNegative),
       assert(decoration == null || decoration.debugAssertIsValid()),
       assert(constraints == null || constraints.debugAssertIsValid()),
       assert(decoration != null || clipBehavior == Clip.none);

  final BaseSurfaceStyle? surfaceStyle;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final bool isAntiAlias;
  final BoxDecoration? decoration;
  final BoxDecoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;
  final double? width;
  final double? height;
  final Widget? child;

  static SurfaceState? of(BuildContext context) =>
      context.findAncestorStateOfType<SurfaceState>();

  @override
  State<Surface> createState() => SurfaceState();
}

class SurfaceState extends State<Surface> {
  BaseSurfaceStyle get style => widget.surfaceStyle ?? SurfacePalette();

  BoxDecoration getBoxDecoration(
    BuildContext context,
    BaseSurfaceStyle style,
    ColorPalette palette,
  ) {
    return BoxDecoration(
      boxShadow: palette.shadow,
      borderRadius: widget.borderRadius ?? context.values.borderS,
      border: style is SurfaceStyle
          ? style.border
          : BoxBorder.all(
              color: palette.border,
              width: 3,
            ),
      color: palette.background,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint([style is SurfacePalette, style.toString()].join(' '));
    final effectiveStyle = style is SurfacePalette
        ? style as SurfacePalette
        : const SurfacePalette();
    final palette = context.appColors.getPalette(effectiveStyle);
    final decor = getBoxDecoration(context, effectiveStyle, palette);
    // final decor = widget.decoration?.copyWithDecoration(d) ?? d;
    final textColor = palette.text;
    return Container(
      alignment: widget.alignment,
      padding: widget.padding,
      isAntiAlias: widget.isAntiAlias,
      decoration: decor,
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
                color: textColor,
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
