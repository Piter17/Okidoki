import 'package:auto_route/auto_route.dart';
import 'package:riv/presentation/presentation.dart';

@RoutePage()
class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
    //  Padding(
    //   padding: context.values.containerPadding,
    //   child: LayoutBuilder.constraints(
    //     builder: (context, constraints) {
    //       return GridView.builder(
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: math.max(constraints.maxWidth ~/ 200, 1),
    //         ),
    //         itemCount: ContextColors.values.length,
    //         itemBuilder: (context, index) => StyledContainer(
    //           width: 200,
    //           height: 200,
    //           margin: EdgeInsets.all(8),
    //           contextStyle: ContextColors.values[index],
    //           child: Center(
    //             child: Text(ContextColors.values[index].toString()),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
