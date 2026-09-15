import 'package:riv/presentation/presentation.dart';

extension RenderBoxX on RenderBox {
  Rect get absoluteRect {
    final pos = localToGlobal(Offset.zero);
    return pos & size;
  }
}
