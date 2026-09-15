import 'package:riv/presentation/presentation.dart';

class StyledContainer extends StatefulWidget {
  StyledContainer({
    required this.contextStyle,
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

  final ContextColors contextStyle;
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

  StyledContainerState of(BuildContext context) =>
      context.findAncestorStateOfType<StyledContainerState>()!;

  @override
  State<StyledContainer> createState() => StyledContainerState();
}

class StyledContainerState extends State<StyledContainer> {
  BoxDecoration getBoxDecoration(BuildContext context, ColorSet colorUsage) =>
      BoxDecoration(
        boxShadow: context.colors.shadow,
        borderRadius: widget.borderRadius ?? context.values.borderS,
        border: BoxBorder.all(
          color: colorUsage.border,
        ),
        color: colorUsage.background,
      );

  @override
  Widget build(BuildContext context) {
    final colorSet = widget.contextStyle.getColorSet(context);
    final style = getBoxDecoration(context, colorSet);
    final decor = widget.decoration != null
        ? widget.decoration!.copyWithDecoration(style)
        : style;
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
                color: colorSet.text,
              ),
              child: DefaultTextStyle(
                style: context.fonts.body.withColor(colorSet.text),
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
