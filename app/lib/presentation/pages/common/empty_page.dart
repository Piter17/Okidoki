import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:darq/darq.dart';
import 'package:riv/presentation/presentation.dart';

@RoutePage()
class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();

    final all = FillType.values
        .cartesian3(FrontStyle.values, BackStyle.values)
        .map(
          (e) => SurfacePalette(
            foreground: e.item1,
            background: e.item2,
            fill: e.item0,
          ),
        );

    final variants = all
        .where(
          (e) => // e.fill == .background
              // &&
              e.foreground == .primary,
        )
        .toList();

    print(variants);

    return Padding(
      padding: context.values.containerPadding,
      child: LayoutBuilder.constraints(
        builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: math.max(constraints.maxWidth ~/ 200, 1),
            ),
            itemCount: variants.length,
            itemBuilder: (context, index) => Surface(
              width: 200,
              height: 200,
              margin: EdgeInsets.all(8),
              surfaceStyle: variants[index],
              child: Center(
                child: Text(variants[index].toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
