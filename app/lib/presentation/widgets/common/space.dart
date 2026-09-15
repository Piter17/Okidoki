import 'package:riv/presentation/presentation.dart';

class Space extends StatelessWidget {
  final double? space;
  final Widget? child;
  const Space({
    this.space,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = space ?? context.values.spacing;
    return switch (context.flexDirection) {
      Axis.horizontal => SizedBox(
        width: size,
        child: child,
      ),
      Axis.vertical => SizedBox(
        height: size,
        child: child,
      ),
    };
  }
}
