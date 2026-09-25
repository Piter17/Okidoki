import 'package:riv/presentation/presentation.dart';

class const PlaceholderGrid({
  super.key,
  final Color Function(int x, int y)? getColor,
  final double maxCellSize = 100,
}) extends StatelessWidget {
  Color _getColor(int x, int y) {
    if (getColor != null) {
      return getColor!(x, y);
    }
    return HSLColor.fromAHSL(
      1.0,
      ((x + y) * 10) % 60,
      0.1,
      .3,
    ).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCellSize,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final x = index % (MediaQuery.of(context).size.width ~/ maxCellSize);
        final y = index ~/ (MediaQuery.of(context).size.width ~/ maxCellSize);
        return ColoredBox(
          color: _getColor(x, y),
        );
      },
      itemCount:
          (MediaQuery.of(context).size.width / maxCellSize).ceil() *
          (MediaQuery.of(context).size.height / maxCellSize).ceil(),
    );
  }
}
